
#include "Polygon.h"

// 11,12だとちょっと精度が悪い
// 13だと32bitオーバーしてしまう
// 64bitで15 ok
#define IMULS 15
#define IMULV (1<<IMULS)

#define CMULS 8
#define CMULV (1<<CMULS)

void Polygon::table_init(void)
{
//FILE *fp; fopen_s(&fp, "table.txt", "w");

	sin_table = new int[360];
	for (int a = 0; a<360; a++) {
		sin_table[a] = (int)(sin(a*M_PI / 180) * 0x100);
//fprintf(fp, "\t\t%d,\n", sin_table[a]);
	}

	cos_table = new int[360];
	for (int a = 0; a<360; a++) {
		cos_table[a] = (int)(cos(a*M_PI / 180) * 0x100);
//fprintf(fp, "\t\t%d,\n", cos_table[a]);
	}

	inv_table = new int[1024];
	for (int a = 0; a<1024; a++) {
		if (a == 0) inv_table[a] = 0;
		else if (a == 1) inv_table[a] = (IMULV - 1) / a;
		else inv_table[a] = IMULV / a;
//fprintf(fp, "\t\t%d,\n", inv_table[a]);
	}

//fclose(fp);
}

uint8 dither(int x, int y, int col)
{
	static int table[16] = {
		-4,  0, -3,  1,
		 2, -2,  3, -1,
		-3,  1, -4,  0,
		 3, -1,  2, -2
	};
	int d = table[((y & 3) << 2) | (x & 3)];
	col += d;
	if (col>255) col = 255;
	else if (col<0) col = 0;
	return col;
}

void Polygon::drawPolyBilinear(uint8 *img, int x1, int y1, int x2, int y2, int x3, int y3, int c1, int c2, int c3)
{
	//	TRACE("%d %d %d %d %d %d\n", x1, y1, x2, y2, x3, y3);

	// 頂点入れ替え
	if (y1 > y2) {
		int xt = x1; x1 = x2; x2 = xt;
		int yt = y1; y1 = y2; y2 = yt;
		int ct = c1; c1 = c2; c2 = ct;
	}
	if (y1 > y3) {
		int xt = x1; x1 = x3; x3 = xt;
		int yt = y1; y1 = y3; y3 = yt;
		int ct = c1; c1 = c3; c3 = ct;
	}
	if (y2 > y3) {
		int xt = x2; x2 = x3; x3 = xt;
		int yt = y2; y2 = y3; y3 = yt;
		int ct = c2; c2 = c3; c3 = ct;
	}

	//	TRACE("%d %d %d %d %d %d\n", x1, y1, x2, y2, x3, y3);

	// 色分解
	int r1 = c1 >> 16, g1 = (c1 >> 8) & 0xFF, b1 = c1 & 0xFF;
	int r2 = c2 >> 16, g2 = (c2 >> 8) & 0xFF, b2 = c2 & 0xFF;
	int r3 = c3 >> 16, g3 = (c3 >> 8) & 0xFF, b3 = c3 & 0xFF;
	//TRACE("%d %d %d %d %d %d %d %d %d\n", r1, g1, b1, r2, g2, b2, r3, g3, b3);

	// intの範囲をオーバーしないように
	// どうしてもy==y1の時などにsx>exとなってしまう場合がある
	int64 ax12 = (((int64)(x2 - x1) << IMULS) * inv_table[y2 - y1]) >> IMULS;
	int64 ax13 = (((int64)(x3 - x1) << IMULS) * inv_table[y3 - y1]) >> IMULS;
	int64 ax23 = (((int64)(x3 - x2) << IMULS) * inv_table[y3 - y2]) >> IMULS;

	//TRACE("%X %X\n", (x2-x1), (x2-x1)<<IMULS);
	//TRACE("a %I64X %I64X %I64X\n", ax12, ax13, ax23);

	int64 x12 = x1 << IMULS;
	int64 x13 = x1 << IMULS;
	int64 x23 = x2 << IMULS;

	int ar12 = (((r2 - r1) << CMULS) * inv_table[y2 - y1]) >> IMULS;
	int ag12 = (((g2 - g1) << CMULS) * inv_table[y2 - y1]) >> IMULS;
	int ab12 = (((b2 - b1) << CMULS) * inv_table[y2 - y1]) >> IMULS;
	int ar13 = (((r3 - r1) << CMULS) * inv_table[y3 - y1]) >> IMULS;
	int ag13 = (((g3 - g1) << CMULS) * inv_table[y3 - y1]) >> IMULS;
	int ab13 = (((b3 - b1) << CMULS) * inv_table[y3 - y1]) >> IMULS;
	int ar23 = (((r3 - r2) << CMULS) * inv_table[y3 - y2]) >> IMULS;
	int ag23 = (((g3 - g2) << CMULS) * inv_table[y3 - y2]) >> IMULS;
	int ab23 = (((b3 - b2) << CMULS) * inv_table[y3 - y2]) >> IMULS;

	int r12 = r1 << CMULS;
	int g12 = g1 << CMULS;
	int b12 = b1 << CMULS;
	int r13 = r1 << CMULS;
	int g13 = g1 << CMULS;
	int b13 = b1 << CMULS;
	int r23 = r2 << CMULS;
	int g23 = g2 << CMULS;
	int b23 = b2 << CMULS;

	int sy = y1, ey = y3;

#define cul(x) ((x)<0 ? (x)|~0x3FF: (x)&0x3FF)
	int eval = cul(y3 - y1) * cul(x2 - x1) - cul(x3 - x1) * cul(y2 - y1);
	//TRACE("eval %d\n", eval);

	for (int y = sy; y <= ey; y++) { // ok

		int64 sx, ex;
		int sr, sg, sb;
		int er, eg, eb;
		if (eval < 0) { // 左に凸
			if (y <= y2 && y1 != y2) {
				sx = x12; sr = r12; sg = g12; sb = b12;
			}
			else {
				sx = x23; sr = r23; sg = g23; sb = b23;
			}
			ex = x13; er = r13; eg = g13; eb = b13;
		}
		else { // 右に凸
			sx = x13; sr = r13; sg = g13; sb = b13;
			if (y <= y2 && y1 != y2) {
				ex = x12; er = r12; eg = g12; eb = b12;
			}
			else {
				ex = x23; er = r23; eg = g23; eb = b23;
			}
		}

		if (y <= y2 && y1 != y2) {
			x12 += ax12;
			r12 += ar12;
			g12 += ag12;
			b12 += ab12;
		}
		else {
			x23 += ax23;
			r23 += ar23;
			g23 += ag23;
			b23 += ab23;
		}
		x13 += ax13;
		r13 += ar13;
		g13 += ag13;
		b13 += ab13;

		if ((sx >> IMULS) > (ex >> IMULS)) {
			//	TRACE("y %d  sy %d ey %d  sx %d ex %d\n", y, sy, ey, sx, ex);
			ex = sx = 640 << IMULS;
		}

		int ar, ag, ab;
//	if(sx!=ex){

		ar = ((er - sr) * inv_table[(ex - sx) >> IMULS]) >> IMULS;
		ag = ((eg - sg) * inv_table[(ex - sx) >> IMULS]) >> IMULS;
		ab = ((eb - sb) * inv_table[(ex - sx) >> IMULS]) >> IMULS;
//	}

		int pr = sr, pg = sg, pb = sb;

		for (int x = (int)(sx >> IMULS); x<(int)(ex >> IMULS); x++) { // ok

			// BMPのためBGRの並びになっている
			uint8 *p = img + ((640 * y) + x) * 3;
			if (dither_on) {
				p[0] = dither(x, y, (pb >> CMULS)) & 0xF0;
				p[1] = dither(x, y, (pg >> CMULS)) & 0xF0;
				p[2] = dither(x, y, (pr >> CMULS)) & 0xF0;
			}
			else {
				p[0] = (pb >> CMULS);
				p[1] = (pg >> CMULS);
				p[2] = (pr >> CMULS);
			}

			pr += ar;
			pg += ag;
			pb += ab;
		}
	}
}

void Polygon::DrawPoly(uint8 *img)
{
	//for(i=0;i<9;i++)TRACE("%d ", tri[i]);TRACE("\n");
	//TRACE("ax %d  ay %d\n", ax, ay);
	const Vertex vA = Vertex(-90, -90, 90, 0xFF4444);
	const Vertex vB = Vertex(90, -90, -90, 0xFFFF44);
	const Vertex vC = Vertex(-90, 90, -90, 0x44FF44);
	const Vertex vD = Vertex(90, 90, 90, 0x4444FF);

	const int men = 4;
	Plane *tri = new Plane[men];
	tri[0] = Plane(vA, vB, vC);
	tri[1] = Plane(vB, vD, vC);
	tri[2] = Plane(vA, vD, vB);
	tri[3] = Plane(vA, vC, vD);

	geometry(tri, men, ax, ay);

	// Zソート準備
	// とりあえず立方体のようなものなら裏面は描画されない
	// ただし時計回り反時計回りをサポートするためにはZソートが必要
	int mp[men];
	zsort(tri, men, mp);

	// 背景
	for (int y = 0; y<480; y++) {
		int col = 0xFF - (y >> 1);
		if(dither_on) col = dither(0, y, col) & 0xF0;
		for (int x = 0; x < 640; x++) {
			uint8 *p = img + (y * 640 + x) * 3;
			p[0] = p[1] = p[2] = col;
		}
	}

	// 0は常に隠れるので描画しなくていい
	for (int p = 1; p<men; p++) {
		int m = mp[p];

		int x1 = tri[m].v[0].x, y1 = tri[m].v[0].y;
		int x2 = tri[m].v[1].x, y2 = tri[m].v[1].y;
		int x3 = tri[m].v[2].x, y3 = tri[m].v[2].y;

		int rgb1 = tri[m].v[0].col;
		int rgb2 = tri[m].v[1].col;
		int rgb3 = tri[m].v[2].col;

		drawPolyBilinear(img, x1, y1, x2, y2, x3, y3, rgb1, rgb2, rgb3);
	}

	delete[] tri;
}
