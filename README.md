# Polygon Gouraud shading
Polygon sample of Gouraud shading.  
In order to implement polygons in an FPGA, I first wrote C++ using floating point and then remodeled it to fixed point.
The JavaScript implementation was useful to get the first spaghetti code in perspective.

## on VC++_floatingpoint
C++ sample writed by floating point.  
Using VisualStudio2015.

## on JavaScript
JavaScript sample.  
It has been tested on IE11, Firefox, and Chrome.
<a target=_blank href=https://pgate1.at-ninja.jp/PSX_on_FPGA/GPU/sample_gouraudshading/Polygon.htm>Sample page</a>

## on VC++_fixedpoint
C++ sample writed by fixed point.  
Using VisualStudio2015.

## on FPGA
FPGA sample for DE0 board.   
Using Altera QuartusII 12.1sp1.

Dither Off  
<img width=700 src=https://pgate1.at-ninja.jp/PSX_on_FPGA/GPU/polygon_DE0_dither_off.jpg>

Dither On (SW1)  
<img width=700 src=https://pgate1.at-ninja.jp/PSX_on_FPGA/GPU/polygon_DE0_dither_on.jpg>
