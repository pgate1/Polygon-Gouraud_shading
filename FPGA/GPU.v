
/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:27 2019
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module GPU ( p_reset , m_clock , dbg , view_on , eR , eG , eB , htiming , hblank_begin , vblank_begin , ax , ay , x , y );
  parameter _state_zsort__st0 = 0;
  parameter _state_zsort__st1 = 1;
  parameter _state_zsort__st2 = 3;
  parameter _state_zsort__st3 = 2;
  parameter _state_rotate__stinit = 0;
  parameter _state_rotate__strx1 = 1;
  parameter _state_rotate__strx2 = 3;
  parameter _state_rotate__stry1 = 2;
  parameter _state_rotate__stry2 = 6;
  parameter _state_rotate__stshift = 7;
  input p_reset, m_clock;
  wire p_reset, m_clock;
  output dbg;
  wire dbg;
  output view_on;
  wire view_on;
  output [3:0] eR;
  wire [3:0] eR;
  output [3:0] eG;
  wire [3:0] eG;
  output [3:0] eB;
  wire [3:0] eB;
  input htiming;
  wire htiming;
  input hblank_begin;
  wire hblank_begin;
  input vblank_begin;
  wire vblank_begin;
  input [8:0] ax;
  wire [8:0] ax;
  input [8:0] ay;
  wire [8:0] ay;
  input [9:0] x;
  wire [9:0] x;
  input [9:0] y;
  wire [9:0] y;
  reg view_reg;
  reg [3:0] eR_reg;
  reg [3:0] eG_reg;
  reg [3:0] eB_reg;
  reg [9:0] px [0:3];
  reg [9:0] py [0:3];
  reg [9:0] pz [0:3];
  reg [23:0] vc [0:3];
  reg [9:0] gx [0:3];
  reg [9:0] gy [0:3];
  reg [9:0] gz [0:3];
  reg [1:0] zs [0:3];
  wire von_0;
  wire von_1;
  wire von_2;
  wire von_3;
  wire voff;
  reg [2:0] local_19_s;
  reg [1:0] index;
  reg [9:0] bx;
  reg [9:0] by;
  reg [9:0] bz;
  reg [9:0] rx1;
  reg [9:0] ry1;
  reg [9:0] rz1;
  reg [9:0] rx2;
  reg [9:0] ry2;
  reg [9:0] rz2;
  reg [9:0] z [0:3];
  wire [8:0] _sin_t_angle;
  wire _sin_t_read;
  wire [9:0] _sin_t_dout;
  wire _sin_t_p_reset;
  wire _sin_t_m_clock;
  wire [8:0] _cos_t_angle;
  wire _cos_t_read;
  wire [9:0] _cos_t_dout;
  wire _cos_t_p_reset;
  wire _cos_t_m_clock;
  wire [9:0] _mul_cos_a;
  wire [9:0] _mul_cos_b;
  wire [19:0] _mul_cos_dout;
  wire _mul_cos_con;
  wire [9:0] _mul_sin_a;
  wire [9:0] _mul_sin_b;
  wire [19:0] _mul_sin_dout;
  wire _mul_sin_con;
  wire [9:0] _poly_3_vx1;
  wire [9:0] _poly_3_vy1;
  wire [23:0] _poly_3_vc1;
  wire [9:0] _poly_3_vx2;
  wire [9:0] _poly_3_vy2;
  wire [23:0] _poly_3_vc2;
  wire [9:0] _poly_3_vx3;
  wire [9:0] _poly_3_vy3;
  wire [23:0] _poly_3_vc3;
  wire [9:0] _poly_3_x;
  wire [9:0] _poly_3_scanline;
  wire _poly_3_enable;
  wire _poly_3_con;
  wire _poly_3_vblank_begin;
  wire _poly_3_hblank_begin;
  wire _poly_3_htiming;
  wire _poly_3_view_on;
  wire [7:0] _poly_3_out_R;
  wire [7:0] _poly_3_out_G;
  wire [7:0] _poly_3_out_B;
  wire _poly_3_dbg;
  wire [19:0] _poly_3_eval_out;
  wire _poly_3_p_reset;
  wire _poly_3_m_clock;
  wire [9:0] _poly_2_vx1;
  wire [9:0] _poly_2_vy1;
  wire [23:0] _poly_2_vc1;
  wire [9:0] _poly_2_vx2;
  wire [9:0] _poly_2_vy2;
  wire [23:0] _poly_2_vc2;
  wire [9:0] _poly_2_vx3;
  wire [9:0] _poly_2_vy3;
  wire [23:0] _poly_2_vc3;
  wire [9:0] _poly_2_x;
  wire [9:0] _poly_2_scanline;
  wire _poly_2_enable;
  wire _poly_2_con;
  wire _poly_2_vblank_begin;
  wire _poly_2_hblank_begin;
  wire _poly_2_htiming;
  wire _poly_2_view_on;
  wire [7:0] _poly_2_out_R;
  wire [7:0] _poly_2_out_G;
  wire [7:0] _poly_2_out_B;
  wire _poly_2_dbg;
  wire [19:0] _poly_2_eval_out;
  wire _poly_2_p_reset;
  wire _poly_2_m_clock;
  wire [9:0] _poly_1_vx1;
  wire [9:0] _poly_1_vy1;
  wire [23:0] _poly_1_vc1;
  wire [9:0] _poly_1_vx2;
  wire [9:0] _poly_1_vy2;
  wire [23:0] _poly_1_vc2;
  wire [9:0] _poly_1_vx3;
  wire [9:0] _poly_1_vy3;
  wire [23:0] _poly_1_vc3;
  wire [9:0] _poly_1_x;
  wire [9:0] _poly_1_scanline;
  wire _poly_1_enable;
  wire _poly_1_con;
  wire _poly_1_vblank_begin;
  wire _poly_1_hblank_begin;
  wire _poly_1_htiming;
  wire _poly_1_view_on;
  wire [7:0] _poly_1_out_R;
  wire [7:0] _poly_1_out_G;
  wire [7:0] _poly_1_out_B;
  wire _poly_1_dbg;
  wire [19:0] _poly_1_eval_out;
  wire _poly_1_p_reset;
  wire _poly_1_m_clock;
  wire [9:0] _poly_0_vx1;
  wire [9:0] _poly_0_vy1;
  wire [23:0] _poly_0_vc1;
  wire [9:0] _poly_0_vx2;
  wire [9:0] _poly_0_vy2;
  wire [23:0] _poly_0_vc2;
  wire [9:0] _poly_0_vx3;
  wire [9:0] _poly_0_vy3;
  wire [23:0] _poly_0_vc3;
  wire [9:0] _poly_0_x;
  wire [9:0] _poly_0_scanline;
  wire _poly_0_enable;
  wire _poly_0_con;
  wire _poly_0_vblank_begin;
  wire _poly_0_hblank_begin;
  wire _poly_0_htiming;
  wire _poly_0_view_on;
  wire [7:0] _poly_0_out_R;
  wire [7:0] _poly_0_out_G;
  wire [7:0] _poly_0_out_B;
  wire _poly_0_dbg;
  wire [19:0] _poly_0_eval_out;
  wire _poly_0_p_reset;
  wire _poly_0_m_clock;
  wire _stage_rotate_wait_set;
  wire _stage_rotate_wait_reset;
  reg _stage_rotate_wait;
  wire _net_0;
  reg _task_rotate_wait_do;
  wire _task_rotate_wait_do_set;
  wire _net_1;
  wire _stage_zsort_set;
  wire _stage_zsort_reset;
  reg _stage_zsort;
  wire _net_2;
  reg _task_zsort_do;
  wire _task_zsort_do_set;
  wire _net_3;
  wire _stage_rotate_set;
  wire _stage_rotate_reset;
  reg _stage_rotate;
  wire _net_4;
  reg _task_rotate_do;
  wire _task_rotate_do_set;
  wire _net_5;
  wire [1:0] _net_6;
  wire _net_7;
  wire [1:0] _net_8;
  wire _net_9;
  wire _net_10;
  wire [1:0] _net_11;
  wire _net_12;
  wire _net_13;
  wire [1:0] _net_14;
  wire _net_15;
  wire _net_16;
  wire [1:0] _net_17;
  wire _net_18;
  wire _net_19;
  wire [1:0] _net_20;
  wire _net_21;
  wire _net_22;
  wire [1:0] _net_23;
  wire _net_24;
  wire _net_25;
  wire [1:0] _net_26;
  wire _net_27;
  wire _net_28;
  wire [1:0] _net_29;
  wire _net_30;
  wire _net_31;
  wire [1:0] _net_32;
  wire _net_33;
  wire _net_34;
  wire [1:0] _net_35;
  wire _net_36;
  wire _net_37;
  wire [1:0] _net_38;
  wire _net_39;
  wire _net_40;
  wire [1:0] _net_41;
  wire _net_42;
  wire _net_43;
  wire [1:0] _net_44;
  wire _net_45;
  wire _net_46;
  wire [1:0] _net_47;
  wire _net_48;
  wire _net_49;
  wire [1:0] _net_50;
  wire _net_51;
  wire _net_52;
  wire _net_53;
  reg _stage_rotate_wait_state_reg;
  wire _net_54;
  wire _net_55;
  wire _net_56;
  wire _net_57;
  wire _net_58;
  wire _net_59;
  reg [1:0] _stage_zsort_state_reg;
  wire _net_60;
  wire [9:0] _net_61;
  wire [9:0] _net_62;
  wire [9:0] _net_63;
  wire [9:0] _net_64;
  wire [9:0] _net_65;
  wire [9:0] _net_66;
  wire [9:0] _net_67;
  wire [9:0] _net_68;
  wire [9:0] _net_69;
  wire [9:0] _net_70;
  wire [9:0] _net_71;
  wire [9:0] _net_72;
  wire _net_73;
  wire [9:0] _net_74;
  wire [9:0] _net_75;
  wire [9:0] _net_76;
  wire _net_77;
  wire _net_78;
  wire _net_79;
  wire _net_80;
  wire _net_81;
  wire _net_82;
  wire _net_83;
  wire _net_84;
  wire _net_85;
  wire _net_86;
  wire [9:0] _net_87;
  wire [9:0] _net_88;
  wire [9:0] _net_89;
  wire _net_90;
  wire _net_91;
  wire _net_92;
  wire _net_93;
  wire _net_94;
  wire _net_95;
  wire _net_96;
  wire _net_97;
  wire _net_98;
  wire [9:0] _net_99;
  wire [9:0] _net_100;
  wire [9:0] _net_101;
  wire _net_102;
  wire _net_103;
  wire _net_104;
  wire _net_105;
  wire _net_106;
  reg [2:0] _stage_rotate_state_reg;
  wire _net_107;
  wire _net_108;
  wire _net_109;
  wire _net_110;
  wire _net_111;
  wire _net_112;
  wire _net_113;
  wire _net_114;
  wire _net_115;
  wire _net_116;
drawGouraud poly_3 (.m_clock(m_clock), .p_reset( p_reset), .eval_out(_poly_3_eval_out), .dbg(_poly_3_dbg), .out_B(_poly_3_out_B), .out_G(_poly_3_out_G), .out_R(_poly_3_out_R), .view_on(_poly_3_view_on), .htiming(_poly_3_htiming), .hblank_begin(_poly_3_hblank_begin), .vblank_begin(_poly_3_vblank_begin), .con(_poly_3_con), .enable(_poly_3_enable), .scanline(_poly_3_scanline), .x(_poly_3_x), .vc3(_poly_3_vc3), .vy3(_poly_3_vy3), .vx3(_poly_3_vx3), .vc2(_poly_3_vc2), .vy2(_poly_3_vy2), .vx2(_poly_3_vx2), .vc1(_poly_3_vc1), .vy1(_poly_3_vy1), .vx1(_poly_3_vx1));
drawGouraud poly_2 (.m_clock(m_clock), .p_reset( p_reset), .eval_out(_poly_2_eval_out), .dbg(_poly_2_dbg), .out_B(_poly_2_out_B), .out_G(_poly_2_out_G), .out_R(_poly_2_out_R), .view_on(_poly_2_view_on), .htiming(_poly_2_htiming), .hblank_begin(_poly_2_hblank_begin), .vblank_begin(_poly_2_vblank_begin), .con(_poly_2_con), .enable(_poly_2_enable), .scanline(_poly_2_scanline), .x(_poly_2_x), .vc3(_poly_2_vc3), .vy3(_poly_2_vy3), .vx3(_poly_2_vx3), .vc2(_poly_2_vc2), .vy2(_poly_2_vy2), .vx2(_poly_2_vx2), .vc1(_poly_2_vc1), .vy1(_poly_2_vy1), .vx1(_poly_2_vx1));
drawGouraud poly_1 (.m_clock(m_clock), .p_reset( p_reset), .eval_out(_poly_1_eval_out), .dbg(_poly_1_dbg), .out_B(_poly_1_out_B), .out_G(_poly_1_out_G), .out_R(_poly_1_out_R), .view_on(_poly_1_view_on), .htiming(_poly_1_htiming), .hblank_begin(_poly_1_hblank_begin), .vblank_begin(_poly_1_vblank_begin), .con(_poly_1_con), .enable(_poly_1_enable), .scanline(_poly_1_scanline), .x(_poly_1_x), .vc3(_poly_1_vc3), .vy3(_poly_1_vy3), .vx3(_poly_1_vx3), .vc2(_poly_1_vc2), .vy2(_poly_1_vy2), .vx2(_poly_1_vx2), .vc1(_poly_1_vc1), .vy1(_poly_1_vy1), .vx1(_poly_1_vx1));
drawGouraud poly_0 (.m_clock(m_clock), .p_reset( p_reset), .eval_out(_poly_0_eval_out), .dbg(_poly_0_dbg), .out_B(_poly_0_out_B), .out_G(_poly_0_out_G), .out_R(_poly_0_out_R), .view_on(_poly_0_view_on), .htiming(_poly_0_htiming), .hblank_begin(_poly_0_hblank_begin), .vblank_begin(_poly_0_vblank_begin), .con(_poly_0_con), .enable(_poly_0_enable), .scanline(_poly_0_scanline), .x(_poly_0_x), .vc3(_poly_0_vc3), .vy3(_poly_0_vy3), .vx3(_poly_0_vx3), .vc2(_poly_0_vc2), .vy2(_poly_0_vy2), .vx2(_poly_0_vx2), .vc1(_poly_0_vc1), .vy1(_poly_0_vy1), .vx1(_poly_0_vx1));
mul_s10 mul_cos (.con(_mul_cos_con), .dout(_mul_cos_dout), .a(_mul_cos_a), .b(_mul_cos_b));
mul_s10 mul_sin (.con(_mul_sin_con), .dout(_mul_sin_dout), .a(_mul_sin_a), .b(_mul_sin_b));
cos_table cos_t (.m_clock(m_clock), .p_reset( p_reset), .dout(_cos_t_dout), .read(_cos_t_read), .angle(_cos_t_angle));
sin_table sin_t (.m_clock(m_clock), .p_reset( p_reset), .dout(_sin_t_dout), .read(_sin_t_read), .angle(_sin_t_angle));

   assign  view_on = view_reg;
   assign  eR = eR_reg;
   assign  eG = eG_reg;
   assign  eB = eB_reg;
   assign  von_0 = (_net_43|(_net_31|(_net_19|_net_7)));
   assign  von_1 = (_net_46|(_net_34|(_net_22|_net_10)));
   assign  von_2 = (_net_49|(_net_37|(_net_25|_net_13)));
   assign  von_3 = (_net_52|(_net_40|(_net_28|_net_16)));
   assign  voff = _net_53;
   assign  dbg = _poly_0_dbg;
   assign  _sin_t_angle = ((_net_109)?ay:9'b0)|
    ((_net_107)?ax:9'b0);
   assign  _sin_t_read = (_net_109|_net_107);
   assign  _sin_t_p_reset = p_reset;
   assign  _sin_t_m_clock = m_clock;
   assign  _cos_t_angle = ((_net_109)?ay:9'b0)|
    ((_net_107)?ax:9'b0);
   assign  _cos_t_read = (_net_109|_net_107);
   assign  _cos_t_p_reset = p_reset;
   assign  _cos_t_m_clock = m_clock;
   assign  _mul_cos_a = ((_net_111)?rz1:10'b0)|
    ((_net_110)?rx1:10'b0)|
    ((_net_109)?bz:10'b0)|
    ((_net_108)?by:10'b0);
   assign  _mul_cos_b = _cos_t_dout;
   assign  _mul_cos_con = (_net_111|(_net_110|(_net_109|_net_108)));
   assign  _mul_sin_a = ((_net_111)?rx1:10'b0)|
    ((_net_110)?rz1:10'b0)|
    ((_net_109)?by:10'b0)|
    ((_net_108)?bz:10'b0);
   assign  _mul_sin_b = _sin_t_dout;
   assign  _mul_sin_con = (_net_111|(_net_110|(_net_109|_net_108)));
   assign  _poly_3_vx1 = (gx[2'b00]);
   assign  _poly_3_vy1 = (gy[2'b00]);
   assign  _poly_3_vc1 = (vc[2'b00]);
   assign  _poly_3_vx2 = (gx[2'b10]);
   assign  _poly_3_vy2 = (gy[2'b10]);
   assign  _poly_3_vc2 = (vc[2'b10]);
   assign  _poly_3_vx3 = (gx[2'b11]);
   assign  _poly_3_vy3 = (gy[2'b11]);
   assign  _poly_3_vc3 = (vc[2'b11]);
   assign  _poly_3_x = x;
   assign  _poly_3_scanline = y;
   assign  _poly_3_enable = 1'b1;
   assign  _poly_3_con = 1'b1;
   assign  _poly_3_vblank_begin = _net_58;
   assign  _poly_3_hblank_begin = hblank_begin;
   assign  _poly_3_htiming = htiming;
   assign  _poly_3_p_reset = p_reset;
   assign  _poly_3_m_clock = m_clock;
   assign  _poly_2_vx1 = (gx[2'b00]);
   assign  _poly_2_vy1 = (gy[2'b00]);
   assign  _poly_2_vc1 = (vc[2'b00]);
   assign  _poly_2_vx2 = (gx[2'b11]);
   assign  _poly_2_vy2 = (gy[2'b11]);
   assign  _poly_2_vc2 = (vc[2'b11]);
   assign  _poly_2_vx3 = (gx[2'b01]);
   assign  _poly_2_vy3 = (gy[2'b01]);
   assign  _poly_2_vc3 = (vc[2'b01]);
   assign  _poly_2_x = x;
   assign  _poly_2_scanline = y;
   assign  _poly_2_enable = 1'b1;
   assign  _poly_2_con = 1'b1;
   assign  _poly_2_vblank_begin = _net_57;
   assign  _poly_2_hblank_begin = hblank_begin;
   assign  _poly_2_htiming = htiming;
   assign  _poly_2_p_reset = p_reset;
   assign  _poly_2_m_clock = m_clock;
   assign  _poly_1_vx1 = (gx[2'b01]);
   assign  _poly_1_vy1 = (gy[2'b01]);
   assign  _poly_1_vc1 = (vc[2'b01]);
   assign  _poly_1_vx2 = (gx[2'b11]);
   assign  _poly_1_vy2 = (gy[2'b11]);
   assign  _poly_1_vc2 = (vc[2'b11]);
   assign  _poly_1_vx3 = (gx[2'b10]);
   assign  _poly_1_vy3 = (gy[2'b10]);
   assign  _poly_1_vc3 = (vc[2'b10]);
   assign  _poly_1_x = x;
   assign  _poly_1_scanline = y;
   assign  _poly_1_enable = 1'b1;
   assign  _poly_1_con = 1'b1;
   assign  _poly_1_vblank_begin = _net_56;
   assign  _poly_1_hblank_begin = hblank_begin;
   assign  _poly_1_htiming = htiming;
   assign  _poly_1_p_reset = p_reset;
   assign  _poly_1_m_clock = m_clock;
   assign  _poly_0_vx1 = (gx[2'b00]);
   assign  _poly_0_vy1 = (gy[2'b00]);
   assign  _poly_0_vc1 = (vc[2'b00]);
   assign  _poly_0_vx2 = (gx[2'b01]);
   assign  _poly_0_vy2 = (gy[2'b01]);
   assign  _poly_0_vc2 = (vc[2'b01]);
   assign  _poly_0_vx3 = (gx[2'b10]);
   assign  _poly_0_vy3 = (gy[2'b10]);
   assign  _poly_0_vc3 = (vc[2'b10]);
   assign  _poly_0_x = x;
   assign  _poly_0_scanline = y;
   assign  _poly_0_enable = 1'b1;
   assign  _poly_0_con = 1'b1;
   assign  _poly_0_vblank_begin = _net_55;
   assign  _poly_0_hblank_begin = hblank_begin;
   assign  _poly_0_htiming = htiming;
   assign  _poly_0_p_reset = p_reset;
   assign  _poly_0_m_clock = m_clock;
   assign  _stage_rotate_wait_set = vblank_begin;
   assign  _stage_rotate_wait_reset = _net_59;
   assign  _net_0 = (_stage_rotate_wait_set|_stage_rotate_wait_reset);
   assign  _task_rotate_wait_do_set = vblank_begin;
   assign  _net_1 = (_task_rotate_wait_do_set|_stage_rotate_wait_reset);
   assign  _stage_zsort_set = _net_114;
   assign  _stage_zsort_reset = _net_84;
   assign  _net_2 = (_stage_zsort_set|_stage_zsort_reset);
   assign  _task_zsort_do_set = _net_115;
   assign  _net_3 = (_task_zsort_do_set|_stage_zsort_reset);
   assign  _stage_rotate_set = vblank_begin;
   assign  _stage_rotate_reset = _net_116;
   assign  _net_4 = (_stage_rotate_set|_stage_rotate_reset);
   assign  _task_rotate_do_set = vblank_begin;
   assign  _net_5 = (_task_rotate_do_set|_stage_rotate_reset);
   assign  _net_6 = (zs[2'b00]);
   assign  _net_7 = ((_net_6==2'b00)&_poly_0_view_on);
   assign  _net_8 = (zs[2'b00]);
   assign  _net_9 = ((_net_8==2'b01)&_poly_1_view_on);
   assign  _net_10 = ((~_net_7)&_net_9);
   assign  _net_11 = (zs[2'b00]);
   assign  _net_12 = ((_net_11==2'b10)&_poly_2_view_on);
   assign  _net_13 = (((~_net_7)&(~_net_9))&_net_12);
   assign  _net_14 = (zs[2'b00]);
   assign  _net_15 = ((_net_14==2'b11)&_poly_3_view_on);
   assign  _net_16 = ((((~_net_7)&(~_net_9))&(~_net_12))&_net_15);
   assign  _net_17 = (zs[2'b01]);
   assign  _net_18 = ((_net_17==2'b00)&_poly_0_view_on);
   assign  _net_19 = (((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&_net_18);
   assign  _net_20 = (zs[2'b01]);
   assign  _net_21 = ((_net_20==2'b01)&_poly_1_view_on);
   assign  _net_22 = ((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&_net_21);
   assign  _net_23 = (zs[2'b01]);
   assign  _net_24 = ((_net_23==2'b10)&_poly_2_view_on);
   assign  _net_25 = (((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&_net_24);
   assign  _net_26 = (zs[2'b01]);
   assign  _net_27 = ((_net_26==2'b11)&_poly_3_view_on);
   assign  _net_28 = ((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&_net_27);
   assign  _net_29 = (zs[2'b10]);
   assign  _net_30 = ((_net_29==2'b00)&_poly_0_view_on);
   assign  _net_31 = (((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&(~_net_27))&_net_30);
   assign  _net_32 = (zs[2'b10]);
   assign  _net_33 = ((_net_32==2'b01)&_poly_1_view_on);
   assign  _net_34 = ((((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&(~_net_27))&(~_net_30))&_net_33);
   assign  _net_35 = (zs[2'b10]);
   assign  _net_36 = ((_net_35==2'b10)&_poly_2_view_on);
   assign  _net_37 = (((((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&(~_net_27))&(~_net_30))&(~_net_33))&_net_36);
   assign  _net_38 = (zs[2'b10]);
   assign  _net_39 = ((_net_38==2'b11)&_poly_3_view_on);
   assign  _net_40 = ((((((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&(~_net_27))&(~_net_30))&(~_net_33))&(~_net_36))&_net_39);
   assign  _net_41 = (zs[2'b11]);
   assign  _net_42 = ((_net_41==2'b00)&_poly_0_view_on);
   assign  _net_43 = (((((((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&(~_net_27))&(~_net_30))&(~_net_33))&(~_net_36))&(~_net_39))&_net_42);
   assign  _net_44 = (zs[2'b11]);
   assign  _net_45 = ((_net_44==2'b01)&_poly_1_view_on);
   assign  _net_46 = ((((((((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&(~_net_27))&(~_net_30))&(~_net_33))&(~_net_36))&(~_net_39))&(~_net_42))&_net_45);
   assign  _net_47 = (zs[2'b11]);
   assign  _net_48 = ((_net_47==2'b10)&_poly_2_view_on);
   assign  _net_49 = (((((((((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&(~_net_27))&(~_net_30))&(~_net_33))&(~_net_36))&(~_net_39))&(~_net_42))&(~_net_45))&_net_48);
   assign  _net_50 = (zs[2'b11]);
   assign  _net_51 = ((_net_50==2'b11)&_poly_3_view_on);
   assign  _net_52 = ((((((((((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&(~_net_27))&(~_net_30))&(~_net_33))&(~_net_36))&(~_net_39))&(~_net_42))&(~_net_45))&(~_net_48))&_net_51);
   assign  _net_53 = ((((((((((((((((~_net_7)&(~_net_9))&(~_net_12))&(~_net_15))&(~_net_18))&(~_net_21))&(~_net_24))&(~_net_27))&(~_net_30))&(~_net_33))&(~_net_36))&(~_net_39))&(~_net_42))&(~_net_45))&(~_net_48))&(~_net_51));
   assign  _net_54 = ((~(_task_rotate_do))&(~(_task_zsort_do)));
   assign  _net_55 = (_stage_rotate_wait&_net_54);
   assign  _net_56 = (_stage_rotate_wait&_net_54);
   assign  _net_57 = (_stage_rotate_wait&_net_54);
   assign  _net_58 = (_stage_rotate_wait&_net_54);
   assign  _net_59 = (_stage_rotate_wait&_net_54);
   assign  _net_60 = ((_stage_zsort_state_reg==_state_zsort__st0)&_stage_zsort);
   assign  _net_61 = ((_net_60)?(gz[2'b00]):10'b0);
   assign  _net_62 = ((_net_60)?(gz[2'b01]):10'b0);
   assign  _net_63 = ((_net_60)?(gz[2'b10]):10'b0);
   assign  _net_64 = ((_net_60)?(gz[2'b01]):10'b0);
   assign  _net_65 = ((_net_60)?(gz[2'b11]):10'b0);
   assign  _net_66 = ((_net_60)?(gz[2'b10]):10'b0);
   assign  _net_67 = ((_net_60)?(gz[2'b00]):10'b0);
   assign  _net_68 = ((_net_60)?(gz[2'b11]):10'b0);
   assign  _net_69 = ((_net_60)?(gz[2'b01]):10'b0);
   assign  _net_70 = ((_net_60)?(gz[2'b00]):10'b0);
   assign  _net_71 = ((_net_60)?(gz[2'b10]):10'b0);
   assign  _net_72 = ((_net_60)?(gz[2'b11]):10'b0);
   assign  _net_73 = ((_stage_zsort_state_reg==_state_zsort__st1)&_stage_zsort);
   assign  _net_74 = ((_net_73)?(z[2'b01]):10'b0);
   assign  _net_75 = ((_net_73)?(z[2'b00]):10'b0);
   assign  _net_76 = (_net_74-_net_75);
   assign  _net_77 = (_net_76[9]);
   assign  _net_78 = (_net_73&_net_77);
   assign  _net_79 = (_net_73&_net_77);
   assign  _net_80 = (_net_73&_net_77);
   assign  _net_81 = (_net_73&_net_77);
   assign  _net_82 = (local_19_s==3'b101);
   assign  _net_83 = (_net_73&_net_82);
   assign  _net_84 = (_net_73&_net_82);
   assign  _net_85 = (_net_73&(~_net_82));
   assign  _net_86 = ((_stage_zsort_state_reg==_state_zsort__st2)&_stage_zsort);
   assign  _net_87 = ((_net_86)?(z[2'b10]):10'b0);
   assign  _net_88 = ((_net_86)?(z[2'b01]):10'b0);
   assign  _net_89 = (_net_87-_net_88);
   assign  _net_90 = (_net_89[9]);
   assign  _net_91 = (_net_86&_net_90);
   assign  _net_92 = (_net_86&_net_90);
   assign  _net_93 = (_net_86&_net_90);
   assign  _net_94 = (_net_86&_net_90);
   assign  _net_95 = (local_19_s==3'b100);
   assign  _net_96 = (_net_86&_net_95);
   assign  _net_97 = (_net_86&(~_net_95));
   assign  _net_98 = ((_stage_zsort_state_reg==_state_zsort__st3)&_stage_zsort);
   assign  _net_99 = ((_net_98)?(z[2'b11]):10'b0);
   assign  _net_100 = ((_net_98)?(z[2'b10]):10'b0);
   assign  _net_101 = (_net_99-_net_100);
   assign  _net_102 = (_net_101[9]);
   assign  _net_103 = (_net_98&_net_102);
   assign  _net_104 = (_net_98&_net_102);
   assign  _net_105 = (_net_98&_net_102);
   assign  _net_106 = (_net_98&_net_102);
   assign  _net_107 = ((_stage_rotate_state_reg==_state_rotate__stinit)&_stage_rotate);
   assign  _net_108 = ((_stage_rotate_state_reg==_state_rotate__strx1)&_stage_rotate);
   assign  _net_109 = ((_stage_rotate_state_reg==_state_rotate__strx2)&_stage_rotate);
   assign  _net_110 = ((_stage_rotate_state_reg==_state_rotate__stry1)&_stage_rotate);
   assign  _net_111 = ((_stage_rotate_state_reg==_state_rotate__stry2)&_stage_rotate);
   assign  _net_112 = ((_stage_rotate_state_reg==_state_rotate__stshift)&_stage_rotate);
   assign  _net_113 = (index==2'b11);
   assign  _net_114 = (_net_112&_net_113);
   assign  _net_115 = (_net_112&_net_113);
   assign  _net_116 = (_net_112&_net_113);
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     view_reg <= 1'b0;
else   view_reg <= (~voff);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     eR_reg <= 4'b0000;
else if ((von_3)|(von_2)|(von_1)|(von_0)) 
      eR_reg <= ((von_3) ?(_poly_3_out_R[7:4]):4'b0)|
    ((von_2) ?(_poly_2_out_R[7:4]):4'b0)|
    ((von_1) ?(_poly_1_out_R[7:4]):4'b0)|
    ((von_0) ?(_poly_0_out_R[7:4]):4'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     eG_reg <= 4'b0000;
else if ((von_3)|(von_2)|(von_1)|(von_0)) 
      eG_reg <= ((von_3) ?(_poly_3_out_G[7:4]):4'b0)|
    ((von_2) ?(_poly_2_out_G[7:4]):4'b0)|
    ((von_1) ?(_poly_1_out_G[7:4]):4'b0)|
    ((von_0) ?(_poly_0_out_G[7:4]):4'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     eB_reg <= 4'b0000;
else if ((von_3)|(von_2)|(von_1)|(von_0)) 
      eB_reg <= ((von_3) ?(_poly_3_out_B[7:4]):4'b0)|
    ((von_2) ?(_poly_2_out_B[7:4]):4'b0)|
    ((von_1) ?(_poly_1_out_B[7:4]):4'b0)|
    ((von_0) ?(_poly_0_out_B[7:4]):4'b0);

end
initial begin
    px[0] = 10'b1110100110;
    px[1] = 10'b0001011010;
    px[2] = 10'b1110100110;
    px[3] = 10'b0001011010;
end
initial begin
    py[0] = 10'b1110100110;
    py[1] = 10'b1110100110;
    py[2] = 10'b0001011010;
    py[3] = 10'b0001011010;
end
initial begin
    pz[0] = 10'b0001011010;
    pz[1] = 10'b1110100110;
    pz[2] = 10'b1110100110;
    pz[3] = 10'b0001011010;
end
initial begin
    vc[0] = 24'b111111110100010001000100;
    vc[1] = 24'b111111111111111101000100;
    vc[2] = 24'b010001001111111101000100;
    vc[3] = 24'b010001000100010011111111;
end
initial begin
    gx[0] = 10'b0000000000;
    gx[1] = 0;
    gx[2] = 0;
    gx[3] = 0;
end
always @(posedge m_clock)
  begin
   if (_net_112 )
     gx[index] <= (rx2+10'b0101000000);
end
initial begin
    gy[0] = 10'b0000000000;
    gy[1] = 0;
    gy[2] = 0;
    gy[3] = 0;
end
always @(posedge m_clock)
  begin
   if (_net_112 )
     gy[index] <= (ry2+10'b0011110000);
end
initial begin
    gz[0] = 10'b0000000000;
    gz[1] = 0;
    gz[2] = 0;
    gz[3] = 0;
end
always @(posedge m_clock)
  begin
   if (_net_112 )
     gz[index] <= rz2;
end
initial begin
    zs[0] = 2'b00;
    zs[1] = 0;
    zs[2] = 0;
    zs[3] = 0;
end
always @(posedge m_clock)
  begin
   if (_net_106 )
     zs[2'b11] <= (zs[2'b10]);
   if (_net_105 )
     zs[2'b10] <= (zs[2'b11]);
   if (_net_94 )
     zs[2'b10] <= (zs[2'b01]);
   if (_net_93 )
     zs[2'b01] <= (zs[2'b10]);
   if (_net_81 )
     zs[2'b01] <= (zs[2'b00]);
   if (_net_80 )
     zs[2'b00] <= (zs[2'b01]);
   if (_net_60 )
     zs[2'b11] <= 2'b11;
   if (_net_60 )
     zs[2'b10] <= 2'b10;
   if (_net_60 )
     zs[2'b01] <= 2'b01;
   if (_net_60 )
     zs[2'b00] <= 2'b00;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     local_19_s <= 3'b000;
else if (((_net_98|(_net_86|_net_73)))|(_net_60)) 
      local_19_s <= (((_net_98|(_net_86|_net_73))) ?(local_19_s+3'b001):3'b0)|
    ((_net_60) ?3'b000:3'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     index <= 2'b00;
else if ((_net_112)) 
      index <= (index+2'b01);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     bx <= 10'b0000000000;
else if ((_net_107)) 
      bx <= (px[index]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     by <= 10'b0000000000;
else if ((_net_107)) 
      by <= (py[index]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     bz <= 10'b0000000000;
else if ((_net_107)) 
      bz <= (pz[index]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     rx1 <= 10'b0000000000;
else if ((_net_108)) 
      rx1 <= bx;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ry1 <= 10'b0000000000;
else if ((_net_108)) 
      ry1 <= ((_mul_cos_dout[17:8])-(_mul_sin_dout[17:8]));
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     rz1 <= 10'b0000000000;
else if ((_net_109)) 
      rz1 <= ((_mul_sin_dout[17:8])+(_mul_cos_dout[17:8]));
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     rx2 <= 10'b0000000000;
else if ((_net_110)) 
      rx2 <= ((_mul_cos_dout[17:8])-(_mul_sin_dout[17:8]));
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ry2 <= 10'b0000000000;
else if ((_net_110)) 
      ry2 <= ry1;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     rz2 <= 10'b0000000000;
else if ((_net_111)) 
      rz2 <= ((_mul_sin_dout[17:8])+(_mul_cos_dout[17:8]));
end
initial begin
    z[0] = 10'b0000000000;
    z[1] = 0;
    z[2] = 0;
    z[3] = 0;
end
always @(posedge m_clock)
  begin
   if (_net_104 )
     z[2'b11] <= (z[2'b10]);
   if (_net_103 )
     z[2'b10] <= (z[2'b11]);
   if (_net_92 )
     z[2'b10] <= (z[2'b01]);
   if (_net_91 )
     z[2'b01] <= (z[2'b10]);
   if (_net_79 )
     z[2'b01] <= (z[2'b00]);
   if (_net_78 )
     z[2'b00] <= (z[2'b01]);
   if (_net_60 )
     z[2'b11] <= ((_net_70+_net_71)+_net_72);
   if (_net_60 )
     z[2'b10] <= ((_net_67+_net_68)+_net_69);
   if (_net_60 )
     z[2'b01] <= ((_net_64+_net_65)+_net_66);
   if (_net_60 )
     z[2'b00] <= ((_net_61+_net_62)+_net_63);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_rotate_wait <= 1'b0;
else if ((_net_0)) 
      _stage_rotate_wait <= _stage_rotate_wait_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _task_rotate_wait_do <= 1'b0;
else if ((_net_1)) 
      _task_rotate_wait_do <= _task_rotate_wait_do_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_zsort <= 1'b0;
else if ((_net_2)) 
      _stage_zsort <= _stage_zsort_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _task_zsort_do <= 1'b0;
else if ((_net_3)) 
      _task_zsort_do <= _task_zsort_do_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_rotate <= 1'b0;
else if ((_net_4)) 
      _stage_rotate <= _stage_rotate_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _task_rotate_do <= 1'b0;
else if ((_net_5)) 
      _task_rotate_do <= _task_rotate_do_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_rotate_wait_state_reg <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_zsort_state_reg <= _state_zsort__st0;
else if ((_net_97)|(_net_85)|(_net_83)|((_net_98|(_net_96|_net_60)))) 
      _stage_zsort_state_reg <= ((_net_97) ?_state_zsort__st3:2'b0)|
    ((_net_85) ?_state_zsort__st2:2'b0)|
    ((_net_83) ?_state_zsort__st0:2'b0)|
    (((_net_98|(_net_96|_net_60))) ?_state_zsort__st1:2'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_rotate_state_reg <= _state_rotate__stinit;
else if ((_net_112)|(_net_111)|(_net_110)|(_net_109)|(_net_108)|(_net_107)) 
      _stage_rotate_state_reg <= ((_net_112) ?_state_rotate__stinit:3'b0)|
    ((_net_111) ?_state_rotate__stshift:3'b0)|
    ((_net_110) ?_state_rotate__stry2:3'b0)|
    ((_net_109) ?_state_rotate__stry1:3'b0)|
    ((_net_108) ?_state_rotate__strx2:3'b0)|
    ((_net_107) ?_state_rotate__strx1:3'b0);

end
endmodule

/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:27 2019
 Licensed to :EVALUATION USER*/
