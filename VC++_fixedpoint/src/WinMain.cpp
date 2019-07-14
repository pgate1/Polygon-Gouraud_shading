
#include "Polygon.h"

class Polygon poly;
int ax, ay;
BOOL m_on = false;
int px, py;

LRESULT CALLBACK WindowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	static HDC bufDC;
	static HBITMAP bufBMP;
	static LPVOID lpPixel;

	switch(uMsg){

		case WM_CREATE:
			bufDC = CreateCompatibleDC(GetDC(hWnd));

			BITMAPINFO bmInfo;
			ZeroMemory(&bmInfo.bmiHeader, sizeof(BITMAPINFOHEADER));
			bmInfo.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
			bmInfo.bmiHeader.biWidth = 640;
			bmInfo.bmiHeader.biHeight = -480;
			bmInfo.bmiHeader.biPlanes = 1;
			bmInfo.bmiHeader.biBitCount = 24;
			bmInfo.bmiHeader.biCompression = BI_RGB;
			bufBMP = CreateDIBSection(NULL, &bmInfo, DIB_RGB_COLORS, (void**)&lpPixel, NULL, 0);
			SelectObject(bufDC, bufBMP);

			ax = 29;
			ay = 324;
			poly.setaxis(ax, ay);

			break;

		case WM_PAINT:
		//	BITMAP bm;
		//	GetObject(bufBMP, sizeof(BITMAP), &bm);
		//	poly.DrawPoly((uint8 *)bm.bmBits);

			poly.DrawPoly((uint8 *)lpPixel);

		//	HDC hDC = GetDC(hWnd);
			PAINTSTRUCT ps;
			HDC hDC;
			hDC = BeginPaint(hWnd, &ps);

			BitBlt(hDC, 0, 0, 640, 480, bufDC, 0, 0, SRCCOPY);

		//	ReleaseDC(hWnd, hDC);
		//	ValidateRect(hWnd, NULL);

			EndPaint(hWnd, &ps);

			break;

		case WM_LBUTTONDOWN:
			px = LOWORD(lParam);
			py = HIWORD(lParam);
			m_on = true;
			break;

		case WM_MOUSEMOVE:
			if (m_on == false) break;

			ax += HIWORD(lParam) - py;
			ay += LOWORD(lParam) - px;

			if (ax<0) ax += 360;
			else if (ax >= 360) ax -= 360;

			if (ay<0) ay += 360;
			else if (ay >= 360) ay -= 360;

			poly.setaxis(ax, ay);

			px = LOWORD(lParam);
			py = HIWORD(lParam);

			InvalidateRect(hWnd, NULL, FALSE);
			break;

		case WM_LBUTTONUP:
			m_on = false;
			break;

	//	case WM_ERASEBKGND: // ”wŒi‚Ì•`‰æ‚ðˆ—‚µ‚½‚±‚Æ‚É‚·‚éB
		//	return TRUE;

		case WM_SIZE:
			break;

		case WM_DESTROY:
			DeleteDC(bufDC);
			DeleteObject(bufBMP);
			PostQuitMessage(0);
			break;

		default:
			return DefWindowProc(hWnd, uMsg, wParam, lParam);
	}
	return 0;
}

int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR lpCmdLine, int nCmdShow)
{
	MSG msg;

	HCURSOR hCursor = LoadCursor(NULL, IDC_ARROW);
	HBRUSH hBrush = (HBRUSH)GetStockObject(NULL_BRUSH);
	WNDCLASS wc = { 0, WindowProc, 0, 0, hInst, NULL, hCursor, hBrush, NULL, "NORMAL" };
	DWORD style = WS_OVERLAPPEDWINDOW | WS_VISIBLE & ~WS_THICKFRAME & ~WS_MAXIMIZEBOX; // ƒTƒCƒY•ÏX•s‰Â
	if (!RegisterClass(&wc) ||
		!CreateWindowEx(0, "NORMAL", "Polygon", style, 50, 50, 640, 480, NULL, NULL, hInst, NULL)) {
		return FALSE;
	}

	while (GetMessage(&msg, NULL, 0, 0) > 0) {
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}

	return (int)msg.wParam;
}
