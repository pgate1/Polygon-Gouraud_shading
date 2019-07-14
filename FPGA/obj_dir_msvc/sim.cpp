#include<stdio.h>

#include "Vcore.h"
#include "Vcore_drawGouraud.h"

void write_ppm(const char *fname, unsigned char **image, int width, int height)
{
	FILE *ofp = fopen(fname, "w");
	fprintf(ofp, "P3\n%d %d %d\n", width, height, 255);

	for (int y = 0; y < height; y++) {
		for (int x = 0; x < width; x++) {
			fprintf(ofp, "%d %d %d\n", image[y][x*3], image[y][x*3+1], image[y][x*3+2]);
		}
	}
	fclose(ofp);
}

int main(void)
{
	Vcore *core = new Vcore;

	unsigned char *view[480];
	for (int i = 0; i < 480; i++) view[i] = new unsigned char[640 * 3];

	// 外部要因
	core->BUTTON = 0x7;

	// リセット
	core->p_reset = 1;
	core->eval();
	core->m_clock = 1;
	core->eval();
	core->p_reset = 0;
	core->eval();
	core->m_clock = 0;
	core->eval();

	FILE *fp;
	fp = fopen("out.txt", "w");

	int frame = 0;

	for (;;) {

		core->m_clock = 1;
		core->eval();

		// 値の設定

		core->m_clock = 0;
		core->eval();

		if (core->v__DOT___vga_vblank_begin) {
			fprintf(fp, "vblank\n");
		}

		if (core->v__DOT___vga_v_en && core->v__DOT___vga_h_en) {
			view[core->v__DOT___vga_v_count][core->v__DOT___vga_h_count * 3 + 0] = core->VGA_R << 4;
			view[core->v__DOT___vga_v_count][core->v__DOT___vga_h_count * 3 + 1] = core->VGA_G << 4;
			view[core->v__DOT___vga_v_count][core->v__DOT___vga_h_count * 3 + 2] = core->VGA_B << 4;
		}

		if (core->v__DOT___vga_vblank_begin) {
			frame++;
			if (frame == 2) break;
		}
	}

	fclose(fp);

	core->final();
	delete core;

	write_ppm("out.ppm", view, 640, 480);
	system("out.ppm");

	for (int i=0; i < 480; i++) delete[] view[i];

	return 0;
}
