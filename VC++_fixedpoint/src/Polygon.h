
#include "common.h"

class Vertex
{
public:
	int x, y, z;
	int col;

	Vertex(int px=0, int py=0, int pz=0, int pcol=0)
	{
		x = px;
		y = py;
		z = pz;
		col = pcol;
	}
};

class Plane
{
public:
	Vertex v[3];

	Plane(Vertex v1=0, Vertex v2=0, Vertex v3=0) {
		v[0] = v1;
		v[1] = v2;
		v[2] = v3;
	}
	Plane(const Plane &obj) {
		v[0] = obj.v[0];
		v[1] = obj.v[1];
		v[2] = obj.v[2];
	}
};

class Polygon
{
	int *sin_table;
	int *cos_table;
	int *inv_table;

	int ax, ay, az;

private:

	void table_init(void);

public:

	Polygon()
	{
		table_init();
	}

	~Polygon()
	{
		delete[] sin_table;
		delete[] cos_table;
		delete[] inv_table;
	}

	void setaxis(int x, int y)
	{
		ax = x;
		ay = y;
	}

	short t_sin(short d, short a)
	{
		short s;
		s = (d * sin_table[a]) >> 8;
		return s;
	}

	short t_cos(short d, short a)
	{
		short s;
		s = (d * cos_table[a]) >> 8;
		return s;
	}

	void rotate_X(Vertex &v, int a, Vertex &rv)
	{
		rv.x = v.x;
		rv.y = t_cos(v.y, a) - t_sin(v.z, a);
		rv.z = t_sin(v.y, a) + t_cos(v.z, a);
	}

	void rotate_Y(Vertex &v, int a, Vertex &rv)
	{
		rv.x = t_cos(v.x, a) - t_sin(v.z, a);
		rv.y = v.y;
		rv.z = t_sin(v.x, a) + t_cos(v.z, a);
	}

	void geometry(Plane *tri, int men, int ax, int ay)
	{
		Vertex rxv, ryv;
		for (int m = 0; m < men; m++) {
			for (int v = 0; v < 3; v++) {
				rotate_X(tri[m].v[v], ax, rxv);
				rotate_Y(rxv, ay, ryv);
				ryv.col = tri[m].v[v].col;
				tri[m].v[v] = ryv;

				// move to center
				tri[m].v[v].x += 320;
				tri[m].v[v].y += 240;
			}
		}
	}

	void zsort(Plane *tri, int men, int *mp)
	{
		int *z = new int[men];
		for (int m = 0; m < men; m++) {
			// 代表Z値を決める
			int z1 = tri[m].v[0].z;
			int z2 = tri[m].v[1].z;
			int z3 = tri[m].v[2].z;

			// 平均(重心) ok /2でも/4でもいい
			z[m] = z1 + z2 + z3;
			mp[m] = m;
		}

		// sort
		for (int j = 0; j < men - 1; j++) {
			for (int i = j + 1; i < men; i++) {
				if (z[i] > z[j]) {
					int zt = z[i]; z[i] = z[j]; z[j] = zt;
					int mpt = mp[i]; mp[i] = mp[j]; mp[j] = mpt;
				}
			}
		}

		delete[] z;
	}

	void drawPolyBilinear(uint8 *lp, int x1, int y1, int x2, int y2, int x3, int y3, int c1, int c2, int c3);
	void DrawPoly(uint8 *lp);
};
