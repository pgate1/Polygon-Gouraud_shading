#pragma once

#include <windows.h>
#include <stdio.h>
#include <math.h>
#define M_PI 3.1415926536

#define	TRACE(_format_, ...) \
{ \
	char temp[MAX_PATH]; \
	sprintf_s(temp, MAX_PATH, _format_, __VA_ARGS__); \
	OutputDebugString(temp); \
}

typedef unsigned char uint8;
typedef long long int64;
