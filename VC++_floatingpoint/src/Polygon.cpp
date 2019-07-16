
#include "Polygon.h"

void Polygon::drawPolyBilinear(uint8 *img, int x1, int y1, int x2, int y2, int x3, int y3, int c1, int c2, int c3)
{
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

	// 色分解
	int r1 = c1 >> 16, g1 = (c1 >> 8) & 0xFF, b1 = c1 & 0xFF;
	int r2 = c2 >> 16, g2 = (c2 >> 8) & 0xFF, b2 = c2 & 0xFF;
	int r3 = c3 >> 16, g3 = (c3 >> 8) & 0xFF, b3 = c3 & 0xFF;

	double ax12 = (double)(x2-x1) / (y2-y1);
	double ax13 = (double)(x3-x1) / (y3-y1);
	double ax23 = (double)(x3-x2) / (y3-y2);

	double x12 = x1;
	double x13 = x1;
	double x23 = x2;

	double ar12 = (double)(r2-r1) / (y2-y1);
	double ag12 = (double)(g2-g1) / (y2-y1);
	double ab12 = (double)(b2-b1) / (y2-y1);
	double ar13 = (double)(r3-r1) / (y3-y1);
	double ag13 = (double)(g3-g1) / (y3-y1);
	double ab13 = (double)(b3-b1) / (y3-y1);
	double ar23 = (double)(r3-r2) / (y3-y2);
	double ag23 = (double)(g3-g2) / (y3-y2);
	double ab23 = (double)(b3-b2) / (y3-y2);

	double r12 = r1;
	double g12 = g1;
	double b12 = b1;
	double r13 = r1;
	double g13 = g1;
	double b13 = b1;
	double r23 = r2;
	double g23 = g2;
	double b23 = b2;

	int sy = y1, ey = y3;

	int eval = (y3 - y1) * (x2 - x1) - (x3 - x1) * (y2 - y1);
	//TRACE("eval %d\n", eval);

	for (int y = sy; y <= ey; y++) {

		double sx, ex;
		double sr, sg, sb;
		double er, eg, eb;
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

		if (sx > ex) {
			ex = sx = 640;
		}
		
		double ar = (er - sr) / (ex - sx);
		double ag = (eg - sg) / (ex - sx);
		double ab = (eb - sb) / (ex - sx);

		double pr = sr, pg = sg, pb = sb;

		for (int x = (int)sx; x<(int)ex; x++) {

			// BMPのためBGRの並びになっている
			uint8 *p = img + ((640 * y) + x) * 3;
			p[0] = (uint8)pb;
			p[1] = (uint8)pg;
			p[2] = (uint8)pr;

			pr += ar;
			pg += ag;
			pb += ab;
		}
	}
}

void Polygon::DrawPoly(uint8 *img)
{
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
