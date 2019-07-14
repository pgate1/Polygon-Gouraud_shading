
/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 19:53:58 2019
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module core ( p_reset , m_clock , VGA_R , VGA_G , VGA_B , VGA_HS , VGA_VS , LEDG , HEX0 , HEX1 , HEX2 , HEX3 , SW , BUTTON );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  output [3:0] VGA_R;
  wire [3:0] VGA_R;
  output [3:0] VGA_G;
  wire [3:0] VGA_G;
  output [3:0] VGA_B;
  wire [3:0] VGA_B;
  output VGA_HS;
  wire VGA_HS;
  output VGA_VS;
  wire VGA_VS;
  output [9:0] LEDG;
  wire [9:0] LEDG;
  output [6:0] HEX0;
  wire [6:0] HEX0;
  output [6:0] HEX1;
  wire [6:0] HEX1;
  output [6:0] HEX2;
  wire [6:0] HEX2;
  output [6:0] HEX3;
  wire [6:0] HEX3;
  input [9:0] SW;
  wire [9:0] SW;
  input [2:0] BUTTON;
  wire [2:0] BUTTON;
  wire btn_0;
  wire btn_1;
  wire btn_2;
  wire [15:0] seg;
  reg clock25M_div;
  reg reset;
  reg [8:0] ax;
  reg [8:0] ay;
  reg [17:0] count;
  wire _cmask_2_bin;
  wire _cmask_2_bout;
  wire _cmask_2_p_reset;
  wire _cmask_2_m_clock;
  wire _cmask_1_bin;
  wire _cmask_1_bout;
  wire _cmask_1_p_reset;
  wire _cmask_1_m_clock;
  wire _cmask_0_bin;
  wire _cmask_0_bout;
  wire _cmask_0_p_reset;
  wire _cmask_0_m_clock;
  wire [3:0] _seg7_3_iDIG;
  wire [6:0] _seg7_3_oSEG;
  wire _seg7_3_con;
  wire _seg7_3_p_reset;
  wire _seg7_3_m_clock;
  wire [3:0] _seg7_2_iDIG;
  wire [6:0] _seg7_2_oSEG;
  wire _seg7_2_con;
  wire _seg7_2_p_reset;
  wire _seg7_2_m_clock;
  wire [3:0] _seg7_1_iDIG;
  wire [6:0] _seg7_1_oSEG;
  wire _seg7_1_con;
  wire _seg7_1_p_reset;
  wire _seg7_1_m_clock;
  wire [3:0] _seg7_0_iDIG;
  wire [6:0] _seg7_0_oSEG;
  wire _seg7_0_con;
  wire _seg7_0_p_reset;
  wire _seg7_0_m_clock;
  wire _vga_htiming;
  wire _vga_h_sync;
  wire _vga_v_sync;
  wire _vga_h_en;
  wire _vga_v_en;
  wire _vga_vblank_begin;
  wire _vga_hblank_begin;
  wire [9:0] _vga_h_count;
  wire [9:0] _vga_v_count;
  wire [3:0] _vga_iR;
  wire [3:0] _vga_iG;
  wire [3:0] _vga_iB;
  wire [3:0] _vga_oR;
  wire [3:0] _vga_oG;
  wire [3:0] _vga_oB;
  wire _vga_p_reset;
  wire _vga_m_clock;
  wire [9:0] _gpu_x;
  wire [9:0] _gpu_y;
  wire [8:0] _gpu_ax;
  wire [8:0] _gpu_ay;
  wire _gpu_vblank_begin;
  wire _gpu_hblank_begin;
  wire _gpu_htiming;
  wire _gpu_view_on;
  wire [3:0] _gpu_eR;
  wire [3:0] _gpu_eG;
  wire [3:0] _gpu_eB;
  wire _gpu_dbg;
  wire _gpu_p_reset;
  wire _gpu_m_clock;
  wire _net_0;
  wire _net_1;
  wire _net_2;
  wire _net_3;
  wire _net_4;
  wire _net_5;
  wire _net_6;
  wire _net_7;
  wire _net_8;
  wire _net_9;
  wire [7:0] _net_10;
  wire _net_11;
  wire _net_12;
  wire _net_13;
  wire _net_14;
  wire _net_15;
  wire _net_16;
  wire _net_17;
  wire _net_18;
  wire _net_19;
  wire _net_20;
  wire _net_21;
GPU gpu (.m_clock(m_clock), .p_reset( p_reset), .dbg(_gpu_dbg), .eB(_gpu_eB), .eG(_gpu_eG), .eR(_gpu_eR), .view_on(_gpu_view_on), .htiming(_gpu_htiming), .hblank_begin(_gpu_hblank_begin), .vblank_begin(_gpu_vblank_begin), .ay(_gpu_ay), .ax(_gpu_ax), .y(_gpu_y), .x(_gpu_x));
vga_ctrl vga (.m_clock(m_clock), .p_reset( p_reset), .oB(_vga_oB), .oG(_vga_oG), .oR(_vga_oR), .iB(_vga_iB), .iG(_vga_iG), .iR(_vga_iR), .v_count(_vga_v_count), .h_count(_vga_h_count), .hblank_begin(_vga_hblank_begin), .vblank_begin(_vga_vblank_begin), .v_en(_vga_v_en), .h_en(_vga_h_en), .v_sync(_vga_v_sync), .h_sync(_vga_h_sync), .htiming(_vga_htiming));
seg7_ctrl seg7_3 (.m_clock(m_clock), .p_reset( p_reset), .con(_seg7_3_con), .oSEG(_seg7_3_oSEG), .iDIG(_seg7_3_iDIG));
seg7_ctrl seg7_2 (.m_clock(m_clock), .p_reset( p_reset), .con(_seg7_2_con), .oSEG(_seg7_2_oSEG), .iDIG(_seg7_2_iDIG));
seg7_ctrl seg7_1 (.m_clock(m_clock), .p_reset( p_reset), .con(_seg7_1_con), .oSEG(_seg7_1_oSEG), .iDIG(_seg7_1_iDIG));
seg7_ctrl seg7_0 (.m_clock(m_clock), .p_reset( p_reset), .con(_seg7_0_con), .oSEG(_seg7_0_oSEG), .iDIG(_seg7_0_iDIG));
chatmask cmask_2 (.m_clock(m_clock), .p_reset( p_reset), .bout(_cmask_2_bout), .bin(_cmask_2_bin));
chatmask cmask_1 (.m_clock(m_clock), .p_reset( p_reset), .bout(_cmask_1_bout), .bin(_cmask_1_bin));
chatmask cmask_0 (.m_clock(m_clock), .p_reset( p_reset), .bout(_cmask_0_bout), .bin(_cmask_0_bin));

   assign  btn_0 = _cmask_0_bout;
   assign  btn_1 = _cmask_1_bout;
   assign  btn_2 = _cmask_2_bout;
   assign  HEX0 = _seg7_0_oSEG;
   assign  HEX1 = _seg7_1_oSEG;
   assign  HEX2 = _seg7_2_oSEG;
   assign  HEX3 = _seg7_3_oSEG;
   assign  seg = ({(ax[7:0]),(ay[7:0])});
   assign  LEDG = ({_gpu_dbg,9'b000000000});
   assign  VGA_HS = _vga_h_sync;
   assign  VGA_VS = _vga_v_sync;
   assign  VGA_R = _vga_oR;
   assign  VGA_G = _vga_oG;
   assign  VGA_B = _vga_oB;
   assign  _cmask_2_bin = (~(BUTTON[2]));
   assign  _cmask_2_p_reset = p_reset;
   assign  _cmask_2_m_clock = m_clock;
   assign  _cmask_1_bin = (~(BUTTON[1]));
   assign  _cmask_1_p_reset = p_reset;
   assign  _cmask_1_m_clock = m_clock;
   assign  _cmask_0_bin = (~(BUTTON[0]));
   assign  _cmask_0_p_reset = p_reset;
   assign  _cmask_0_m_clock = m_clock;
   assign  _seg7_3_iDIG = (seg[15:12]);
   assign  _seg7_3_con = 1'b1;
   assign  _seg7_3_p_reset = p_reset;
   assign  _seg7_3_m_clock = m_clock;
   assign  _seg7_2_iDIG = (seg[11:8]);
   assign  _seg7_2_con = 1'b1;
   assign  _seg7_2_p_reset = p_reset;
   assign  _seg7_2_m_clock = m_clock;
   assign  _seg7_1_iDIG = (seg[7:4]);
   assign  _seg7_1_con = 1'b1;
   assign  _seg7_1_p_reset = p_reset;
   assign  _seg7_1_m_clock = m_clock;
   assign  _seg7_0_iDIG = (seg[3:0]);
   assign  _seg7_0_con = 1'b1;
   assign  _seg7_0_p_reset = p_reset;
   assign  _seg7_0_m_clock = m_clock;
   assign  _vga_htiming = _net_3;
   assign  _vga_iR = ((_net_9)?(_net_10[7:4]):4'b0)|
    ((_net_6)?_gpu_eR:4'b0)|
    ((_net_5)?4'b1111:4'b0);
   assign  _vga_iG = ((_net_11)?_vga_iR:4'b0)|
    ((_net_7)?_gpu_eG:4'b0)|
    ((_net_5)?4'b1111:4'b0);
   assign  _vga_iB = ((_net_12)?_vga_iR:4'b0)|
    ((_net_8)?_gpu_eB:4'b0)|
    ((_net_5)?4'b1111:4'b0);
   assign  _vga_p_reset = p_reset;
   assign  _vga_m_clock = m_clock;
   assign  _gpu_x = _vga_h_count;
   assign  _gpu_y = _vga_v_count;
   assign  _gpu_ax = ax;
   assign  _gpu_ay = ay;
   assign  _gpu_vblank_begin = _vga_vblank_begin;
   assign  _gpu_hblank_begin = _net_13;
   assign  _gpu_htiming = _net_4;
   assign  _gpu_p_reset = p_reset;
   assign  _gpu_m_clock = m_clock;
   assign  _net_0 = (reset != 1'b0);
   assign  _net_1 = (reset != 1'b0);
   assign  _net_2 = (reset != 1'b0);
   assign  _net_3 = (clock25M_div != 1'b0);
   assign  _net_4 = (clock25M_div != 1'b0);
   assign  _net_5 = ((SW[0])&((((_vga_h_count==10'b0000000000)|(_vga_h_count==10'b1001111111))|(_vga_v_count==10'b0000000000))|(_vga_v_count==10'b0111011111)));
   assign  _net_6 = ((~_net_5)&_gpu_view_on);
   assign  _net_7 = ((~_net_5)&_gpu_view_on);
   assign  _net_8 = ((~_net_5)&_gpu_view_on);
   assign  _net_9 = ((~_net_5)&(~_gpu_view_on));
   assign  _net_10 = (8'b11111111-(_vga_v_count[8:1]));
   assign  _net_11 = ((~_net_5)&(~_gpu_view_on));
   assign  _net_12 = ((~_net_5)&(~_gpu_view_on));
   assign  _net_13 = (_vga_hblank_begin&(_vga_v_en != 1'b0));
   assign  _net_14 = (btn_2&(&count));
   assign  _net_15 = (ax==9'b101100111);
   assign  _net_16 = (_net_14&_net_15);
   assign  _net_17 = (_net_14&(~_net_15));
   assign  _net_18 = (btn_1&(&count));
   assign  _net_19 = (ay==9'b101100111);
   assign  _net_20 = (_net_18&_net_19);
   assign  _net_21 = (_net_18&(~_net_19));
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     clock25M_div <= 1'b0;
else   clock25M_div <= (~clock25M_div);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     reset <= 1'b1;
else if ((_net_0)) 
      reset <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ax <= 9'b000000000;
else if ((_net_17)|(_net_16)|(_net_1)) 
      ax <= ((_net_17) ?(ax+9'b000000001):9'b0)|
    ((_net_16) ?9'b000000000:9'b0)|
    ((_net_1) ?9'b000011101:9'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ay <= 9'b000000000;
else if ((_net_21)|(_net_20)|(_net_2)) 
      ay <= ((_net_21) ?(ay+9'b000000001):9'b0)|
    ((_net_20) ?9'b000000000:9'b0)|
    ((_net_2) ?9'b101000100:9'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     count <= 18'b000000000000000000;
else   count <= (count+18'b000000000000000001);
end
endmodule

/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 19:53:58 2019
 Licensed to :EVALUATION USER*/
