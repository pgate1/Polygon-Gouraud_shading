
/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:29 2019
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module drawGouraud ( p_reset , m_clock , eval_out , dbg , out_R , out_G , out_B , view_on , htiming , hblank_begin , vblank_begin , con , enable , x , scanline , vx3 , vy3 , vc3 , vx2 , vy2 , vc2 , vx1 , vy1 , vc1 );
  parameter _state_bilinear_hbase__st1 = 0;
  parameter _state_bilinear_hbase__st2 = 1;
  parameter _state_bilinear_hbase__st_ab = 3;
  parameter _state_bilinear_hbase__st_ag = 2;
  parameter _state_bilinear_hbase__st_ar = 6;
  parameter _state_bilinear_vbase__st1 = 0;
  parameter _state_bilinear_vbase__st_ab12 = 1;
  parameter _state_bilinear_vbase__st_ab13 = 3;
  parameter _state_bilinear_vbase__st_ab23 = 2;
  parameter _state_bilinear_vbase__st_ag12 = 6;
  parameter _state_bilinear_vbase__st_ag13 = 7;
  parameter _state_bilinear_vbase__st_ag23 = 5;
  parameter _state_bilinear_vbase__st_ar12 = 4;
  parameter _state_bilinear_vbase__st_ar13 = 12;
  parameter _state_bilinear_vbase__st_ar23 = 13;
  parameter _state_bilinear_vbase__st_ax12 = 15;
  parameter _state_bilinear_vbase__st_ax13 = 14;
  parameter _state_bilinear_vbase__st_ax23 = 10;
  parameter _state_vertex_change__st1 = 0;
  parameter _state_vertex_change__st2 = 1;
  parameter _state_vertex_change__st3 = 3;
  parameter _state_vertex_change__st4 = 2;
  parameter _state_vertex_change__st5 = 6;
  input p_reset, m_clock;
  wire p_reset, m_clock;
  output [19:0] eval_out;
  wire [19:0] eval_out;
  output dbg;
  wire dbg;
  output [7:0] out_R;
  wire [7:0] out_R;
  output [7:0] out_G;
  wire [7:0] out_G;
  output [7:0] out_B;
  wire [7:0] out_B;
  output view_on;
  wire view_on;
  input htiming;
  wire htiming;
  input hblank_begin;
  wire hblank_begin;
  input vblank_begin;
  wire vblank_begin;
  input con;
  wire con;
  input enable;
  wire enable;
  input [9:0] x;
  wire [9:0] x;
  input [9:0] scanline;
  wire [9:0] scanline;
  input [9:0] vx3;
  wire [9:0] vx3;
  input [9:0] vy3;
  wire [9:0] vy3;
  input [23:0] vc3;
  wire [23:0] vc3;
  input [9:0] vx2;
  wire [9:0] vx2;
  input [9:0] vy2;
  wire [9:0] vy2;
  input [23:0] vc2;
  wire [23:0] vc2;
  input [9:0] vx1;
  wire [9:0] vx1;
  input [9:0] vy1;
  wire [9:0] vy1;
  input [23:0] vc1;
  wire [23:0] vc1;
  reg [9:0] y;
  reg [9:0] x1;
  reg [9:0] y1;
  reg [7:0] r1;
  reg [7:0] g1;
  reg [7:0] b1;
  reg [9:0] x2;
  reg [9:0] y2;
  reg [7:0] r2;
  reg [7:0] g2;
  reg [7:0] b2;
  reg [9:0] x3;
  reg [9:0] y3;
  reg [7:0] r3;
  reg [7:0] g3;
  reg [7:0] b3;
  reg [9:0] sy;
  reg [9:0] ey;
  reg [9:0] sx;
  reg [9:0] ex;
  reg [15:0] ar;
  reg [15:0] ag;
  reg [15:0] ab;
  reg [15:0] pr;
  reg [15:0] pg;
  reg [15:0] pb;
  reg f_y_en;
  reg f_x_en;
  reg dbg_reg;
  reg [9:0] tx1;
  reg [9:0] ty1;
  reg [23:0] tc1;
  reg [9:0] tx2;
  reg [9:0] ty2;
  reg [23:0] tc2;
  reg [9:0] tx3;
  reg [9:0] ty3;
  reg [23:0] tc3;
  reg [24:0] x12;
  reg [24:0] x13;
  reg [24:0] x23;
  reg [24:0] ax12;
  reg [24:0] ax13;
  reg [24:0] ax23;
  reg [15:0] r12;
  reg [15:0] g12;
  reg [15:0] b12;
  reg [15:0] r13;
  reg [15:0] g13;
  reg [15:0] b13;
  reg [15:0] r23;
  reg [15:0] g23;
  reg [15:0] b23;
  reg [15:0] ar12;
  reg [15:0] ag12;
  reg [15:0] ab12;
  reg [15:0] ar13;
  reg [15:0] ag13;
  reg [15:0] ab13;
  reg [15:0] ar23;
  reg [15:0] ag23;
  reg [15:0] ab23;
  wire [19:0] eval;
  wire [7:0] sr;
  wire [7:0] sg;
  wire [7:0] sb;
  wire [7:0] er;
  wire [7:0] eg;
  wire [7:0] eb;
  wire [9:0] _inv_t_adrs;
  wire _inv_t_read;
  wire [15:0] _inv_t_dout;
  wire _inv_t_p_reset;
  wire _inv_t_m_clock;
  wire [16:0] _mulc_a;
  wire [15:0] _mulc_b;
  wire [32:0] _mulc_dout;
  wire _mulc_con;
  wire _stage_bilinear_hbase_set;
  wire _stage_bilinear_hbase_reset;
  reg _stage_bilinear_hbase;
  wire _net_0;
  reg _task_bilinear_hbase_do;
  wire _task_bilinear_hbase_do_set;
  wire _net_1;
  wire _stage_bilinear_vbase_set;
  wire _stage_bilinear_vbase_reset;
  reg _stage_bilinear_vbase;
  wire _net_2;
  reg _task_bilinear_vbase_do;
  wire _task_bilinear_vbase_do_set;
  wire _net_3;
  wire _stage_vertex_change_set;
  wire _stage_vertex_change_reset;
  reg _stage_vertex_change;
  wire _net_4;
  reg _task_vertex_change_do;
  wire _task_vertex_change_do_set;
  wire _net_5;
  wire _net_6;
  wire _net_7;
  wire _net_8;
  wire _net_9;
  wire _net_10;
  wire _net_11;
  wire _net_12;
  wire _net_13;
  wire _net_14;
  wire _net_15;
  wire _net_16;
  wire _net_17;
  wire _net_18;
  reg [2:0] _stage_bilinear_hbase_state_reg;
  wire [9:0] _mule2_a;
  wire [9:0] _mule2_b;
  wire [19:0] _mule2_dout;
  wire _mule2_con;
  wire [9:0] _mule1_a;
  wire [9:0] _mule1_b;
  wire [19:0] _mule1_dout;
  wire _mule1_con;
  wire _net_19;
  wire [9:0] _net_20;
  wire _net_21;
  wire _net_22;
  wire _net_23;
  wire _net_24;
  wire _net_25;
  wire _net_26;
  wire _net_27;
  wire _net_28;
  wire _net_29;
  wire _net_30;
  wire _net_31;
  wire _net_32;
  wire _net_33;
  wire _net_34;
  wire [9:0] _net_35;
  wire _net_36;
  wire _net_37;
  wire _net_38;
  wire _net_39;
  wire _net_40;
  wire _net_41;
  wire _net_42;
  wire _net_43;
  wire _net_44;
  wire _net_45;
  wire [9:0] _net_46;
  wire _net_47;
  wire _net_48;
  wire _net_49;
  wire _net_50;
  wire _net_51;
  wire _net_52;
  wire [9:0] _net_53;
  wire _net_54;
  wire _net_55;
  wire _net_56;
  wire _net_57;
  wire _net_58;
  wire [9:0] _net_59;
  wire _net_60;
  wire _net_61;
  wire _net_62;
  wire _net_63;
  wire _net_64;
  wire _net_65;
  wire [8:0] _net_66;
  wire _net_67;
  wire [8:0] _net_68;
  wire _net_69;
  wire [8:0] _net_70;
  wire [9:0] _net_71;
  wire _net_72;
  wire _net_73;
  wire _net_74;
  wire _net_75;
  wire _net_76;
  wire _net_77;
  wire _net_78;
  wire _net_79;
  wire _net_80;
  reg [3:0] _stage_bilinear_vbase_state_reg;
  wire [24:0] _mulx_a;
  wire [15:0] _mulx_b;
  wire [40:0] _mulx_dout;
  wire _mulx_con;
  wire _net_81;
  wire _net_82;
  wire [9:0] _net_83;
  wire _net_84;
  wire [9:0] _net_85;
  wire _net_86;
  wire [9:0] _net_87;
  wire _net_88;
  wire [8:0] _net_89;
  wire _net_90;
  wire [8:0] _net_91;
  wire _net_92;
  wire [8:0] _net_93;
  wire _net_94;
  wire [8:0] _net_95;
  wire _net_96;
  wire [8:0] _net_97;
  wire _net_98;
  wire [8:0] _net_99;
  wire _net_100;
  wire [8:0] _net_101;
  wire _net_102;
  wire [8:0] _net_103;
  wire _net_104;
  wire [8:0] _net_105;
  reg [2:0] _stage_vertex_change_state_reg;
  wire _net_106;
  wire _net_107;
  wire [9:0] _net_108;
  wire _net_109;
  wire _net_110;
  wire _net_111;
  wire _net_112;
  wire _net_113;
  wire _net_114;
  wire _net_115;
  wire _net_116;
  wire [9:0] _net_117;
  wire _net_118;
  wire _net_119;
  wire _net_120;
  wire _net_121;
  wire _net_122;
  wire _net_123;
  wire _net_124;
  wire _net_125;
  wire [9:0] _net_126;
  wire _net_127;
  wire _net_128;
  wire _net_129;
  wire _net_130;
  wire _net_131;
  wire _net_132;
  wire _net_133;
  wire _net_134;
mul_s17x16 mulc (.con(_mulc_con), .dout(_mulc_dout), .a(_mulc_a), .b(_mulc_b));
inv_table inv_t (.m_clock(m_clock), .p_reset( p_reset), .dout(_inv_t_dout), .read(_inv_t_read), .adrs(_inv_t_adrs));
mul_s25x16 mulx (.con(_mulx_con), .dout(_mulx_dout), .a(_mulx_a), .b(_mulx_b));
mul_s10 mule2 (.con(_mule2_con), .dout(_mule2_dout), .a(_mule2_a), .b(_mule2_b));
mul_s10 mule1 (.con(_mule1_con), .dout(_mule1_dout), .a(_mule1_a), .b(_mule1_b));

   assign  view_on = ((enable&f_y_en)&f_x_en);
   assign  out_R = (pr[15:8]);
   assign  out_G = (pg[15:8]);
   assign  out_B = (pb[15:8]);
   assign  dbg = dbg_reg;
   assign  eval_out = eval;
   assign  eval = (_mule1_dout-_mule2_dout);
   assign  sr = ((_net_32)?(r13[15:8]):8'b0)|
    ((_net_26)?(r23[15:8]):8'b0)|
    ((_net_23)?(r12[15:8]):8'b0);
   assign  sg = ((_net_33)?(g13[15:8]):8'b0)|
    ((_net_27)?(g23[15:8]):8'b0)|
    ((_net_24)?(g12[15:8]):8'b0);
   assign  sb = ((_net_34)?(b13[15:8]):8'b0)|
    ((_net_28)?(b23[15:8]):8'b0)|
    ((_net_25)?(b12[15:8]):8'b0);
   assign  er = ((_net_41)?(r23[15:8]):8'b0)|
    ((_net_38)?(r12[15:8]):8'b0)|
    ((_net_29)?(r13[15:8]):8'b0);
   assign  eg = ((_net_42)?(g23[15:8]):8'b0)|
    ((_net_39)?(g12[15:8]):8'b0)|
    ((_net_30)?(g13[15:8]):8'b0);
   assign  eb = ((_net_43)?(b23[15:8]):8'b0)|
    ((_net_40)?(b12[15:8]):8'b0)|
    ((_net_31)?(b13[15:8]):8'b0);
   assign  _inv_t_adrs = (((_net_98|_net_84))?(y3-y2):10'b0)|
    (((_net_92|_net_82))?(y3-y1):10'b0)|
    (((_net_86|_net_81))?(y2-y1):10'b0)|
    ((_net_58)?(ex-sx):10'b0);
   assign  _inv_t_read = (_net_98|(_net_92|(_net_86|(_net_84|(_net_82|(_net_81|_net_58))))));
   assign  _inv_t_p_reset = p_reset;
   assign  _inv_t_m_clock = m_clock;
   assign  _mulc_a = ((_net_104)?({_net_105,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_102)?({_net_103,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_100)?({_net_101,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_98)?({_net_99,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_96)?({_net_97,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_94)?({_net_95,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_92)?({_net_93,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_90)?({_net_91,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_88)?({_net_89,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_69)?({_net_70,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_67)?({_net_68,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0)|
    ((_net_65)?({_net_66,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):17'b0);
   assign  _mulc_b = _inv_t_dout;
   assign  _mulc_con = (_net_104|(_net_102|(_net_100|(_net_98|(_net_96|(_net_94|(_net_92|(_net_90|(_net_88|(_net_69|(_net_67|_net_65)))))))))));
   assign  _stage_bilinear_hbase_set = _net_11;
   assign  _stage_bilinear_hbase_reset = (_net_69|_net_63);
   assign  _net_0 = (_stage_bilinear_hbase_set|_stage_bilinear_hbase_reset);
   assign  _task_bilinear_hbase_do_set = _net_12;
   assign  _net_1 = (_task_bilinear_hbase_do_set|_stage_bilinear_hbase_reset);
   assign  _stage_bilinear_vbase_set = _net_134;
   assign  _stage_bilinear_vbase_reset = _net_104;
   assign  _net_2 = (_stage_bilinear_vbase_set|_stage_bilinear_vbase_reset);
   assign  _task_bilinear_vbase_do_set = _net_134;
   assign  _net_3 = (_task_bilinear_vbase_do_set|_stage_bilinear_vbase_reset);
   assign  _stage_vertex_change_set = vblank_begin;
   assign  _stage_vertex_change_reset = _net_134;
   assign  _net_4 = (_stage_vertex_change_set|_stage_vertex_change_reset);
   assign  _task_vertex_change_do_set = vblank_begin;
   assign  _net_5 = (_task_vertex_change_do_set|_stage_vertex_change_reset);
   assign  _net_6 = (scanline==ey);
   assign  _net_7 = (hblank_begin&_net_6);
   assign  _net_8 = ((scanline+10'b0000000001)==sy);
   assign  _net_9 = (hblank_begin&_net_8);
   assign  _net_10 = (((scanline+10'b0000000001)==sy)|f_y_en);
   assign  _net_11 = (hblank_begin&_net_10);
   assign  _net_12 = (hblank_begin&_net_10);
   assign  _net_13 = (((x==sx)&(~(_task_bilinear_hbase_do)))&(sx != ex));
   assign  _net_14 = (x==ex);
   assign  _net_15 = ((~_net_13)&_net_14);
   assign  _net_16 = (htiming&(f_x_en != 1'b0));
   assign  _net_17 = (htiming&(f_x_en != 1'b0));
   assign  _net_18 = (htiming&(f_x_en != 1'b0));
   assign  _mule2_a = (x3-x1);
   assign  _mule2_b = (y2-y1);
   assign  _mule2_con = _stage_bilinear_hbase;
   assign  _mule1_a = (y3-y1);
   assign  _mule1_b = (x2-x1);
   assign  _mule1_con = _stage_bilinear_hbase;
   assign  _net_19 = (eval[16]);
   assign  _net_20 = (y2-y);
   assign  _net_21 = (((_net_20[9])==1'b0)&(y1 != y2));
   assign  _net_22 = (_stage_bilinear_hbase&_net_19);
   assign  _net_23 = ((_stage_bilinear_hbase&_net_19)&_net_21);
   assign  _net_24 = ((_stage_bilinear_hbase&_net_19)&_net_21);
   assign  _net_25 = ((_stage_bilinear_hbase&_net_19)&_net_21);
   assign  _net_26 = ((_stage_bilinear_hbase&_net_19)&(~_net_21));
   assign  _net_27 = ((_stage_bilinear_hbase&_net_19)&(~_net_21));
   assign  _net_28 = ((_stage_bilinear_hbase&_net_19)&(~_net_21));
   assign  _net_29 = (_stage_bilinear_hbase&_net_19);
   assign  _net_30 = (_stage_bilinear_hbase&_net_19);
   assign  _net_31 = (_stage_bilinear_hbase&_net_19);
   assign  _net_32 = (_stage_bilinear_hbase&(~_net_19));
   assign  _net_33 = (_stage_bilinear_hbase&(~_net_19));
   assign  _net_34 = (_stage_bilinear_hbase&(~_net_19));
   assign  _net_35 = (y2-y);
   assign  _net_36 = (((_net_35[9])==1'b0)&(y1 != y2));
   assign  _net_37 = (_stage_bilinear_hbase&(~_net_19));
   assign  _net_38 = ((_stage_bilinear_hbase&(~_net_19))&_net_36);
   assign  _net_39 = ((_stage_bilinear_hbase&(~_net_19))&_net_36);
   assign  _net_40 = ((_stage_bilinear_hbase&(~_net_19))&_net_36);
   assign  _net_41 = ((_stage_bilinear_hbase&(~_net_19))&(~_net_36));
   assign  _net_42 = ((_stage_bilinear_hbase&(~_net_19))&(~_net_36));
   assign  _net_43 = ((_stage_bilinear_hbase&(~_net_19))&(~_net_36));
   assign  _net_44 = ((_stage_bilinear_hbase_state_reg==_state_bilinear_hbase__st1)&_stage_bilinear_hbase);
   assign  _net_45 = (eval[16]);
   assign  _net_46 = (y2-y);
   assign  _net_47 = (((_net_46[9])==1'b0)&(y1 != y2));
   assign  _net_48 = (_net_44&_net_45);
   assign  _net_49 = ((_net_44&_net_45)&_net_47);
   assign  _net_50 = ((_net_44&_net_45)&(~_net_47));
   assign  _net_51 = (_net_44&_net_45);
   assign  _net_52 = (_net_44&(~_net_45));
   assign  _net_53 = (y2-y);
   assign  _net_54 = (((_net_53[9])==1'b0)&(y1 != y2));
   assign  _net_55 = (_net_44&(~_net_45));
   assign  _net_56 = ((_net_44&(~_net_45))&_net_54);
   assign  _net_57 = ((_net_44&(~_net_45))&(~_net_54));
   assign  _net_58 = ((_stage_bilinear_hbase_state_reg==_state_bilinear_hbase__st2)&_stage_bilinear_hbase);
   assign  _net_59 = (ex-sx);
   assign  _net_60 = (_net_59[9]);
   assign  _net_61 = (_net_58&_net_60);
   assign  _net_62 = (_net_58&_net_60);
   assign  _net_63 = (_net_58&_net_60);
   assign  _net_64 = (_net_58&(~_net_60));
   assign  _net_65 = ((_stage_bilinear_hbase_state_reg==_state_bilinear_hbase__st_ar)&_stage_bilinear_hbase);
   assign  _net_66 = (({1'b0,er})-({1'b0,sr}));
   assign  _net_67 = ((_stage_bilinear_hbase_state_reg==_state_bilinear_hbase__st_ag)&_stage_bilinear_hbase);
   assign  _net_68 = (({1'b0,eg})-({1'b0,sg}));
   assign  _net_69 = ((_stage_bilinear_hbase_state_reg==_state_bilinear_hbase__st_ab)&_stage_bilinear_hbase);
   assign  _net_70 = (({1'b0,eb})-({1'b0,sb}));
   assign  _net_71 = (y2-y);
   assign  _net_72 = (((_net_71[9])==1'b0)&(y1 != y2));
   assign  _net_73 = (_net_69&_net_72);
   assign  _net_74 = (_net_69&_net_72);
   assign  _net_75 = (_net_69&_net_72);
   assign  _net_76 = (_net_69&_net_72);
   assign  _net_77 = (_net_69&(~_net_72));
   assign  _net_78 = (_net_69&(~_net_72));
   assign  _net_79 = (_net_69&(~_net_72));
   assign  _net_80 = (_net_69&(~_net_72));
   assign  _mulx_a = ((_net_86)?({_net_87,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):25'b0)|
    ((_net_84)?({_net_85,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):25'b0)|
    ((_net_82)?({_net_83,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):25'b0);
   assign  _mulx_b = _inv_t_dout;
   assign  _mulx_con = (_net_86|(_net_84|_net_82));
   assign  _net_81 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st1)&_stage_bilinear_vbase);
   assign  _net_82 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ax12)&_stage_bilinear_vbase);
   assign  _net_83 = (x2-x1);
   assign  _net_84 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ax13)&_stage_bilinear_vbase);
   assign  _net_85 = (x3-x1);
   assign  _net_86 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ax23)&_stage_bilinear_vbase);
   assign  _net_87 = (x3-x2);
   assign  _net_88 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ar12)&_stage_bilinear_vbase);
   assign  _net_89 = (({1'b0,r2})-({1'b0,r1}));
   assign  _net_90 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ag12)&_stage_bilinear_vbase);
   assign  _net_91 = (({1'b0,g2})-({1'b0,g1}));
   assign  _net_92 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ab12)&_stage_bilinear_vbase);
   assign  _net_93 = (({1'b0,b2})-({1'b0,b1}));
   assign  _net_94 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ar13)&_stage_bilinear_vbase);
   assign  _net_95 = (({1'b0,r3})-({1'b0,r1}));
   assign  _net_96 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ag13)&_stage_bilinear_vbase);
   assign  _net_97 = (({1'b0,g3})-({1'b0,g1}));
   assign  _net_98 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ab13)&_stage_bilinear_vbase);
   assign  _net_99 = (({1'b0,b3})-({1'b0,b1}));
   assign  _net_100 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ar23)&_stage_bilinear_vbase);
   assign  _net_101 = (({1'b0,r3})-({1'b0,r2}));
   assign  _net_102 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ag23)&_stage_bilinear_vbase);
   assign  _net_103 = (({1'b0,g3})-({1'b0,g2}));
   assign  _net_104 = ((_stage_bilinear_vbase_state_reg==_state_bilinear_vbase__st_ab23)&_stage_bilinear_vbase);
   assign  _net_105 = (({1'b0,b3})-({1'b0,b2}));
   assign  _net_106 = ((_stage_vertex_change_state_reg==_state_vertex_change__st1)&_stage_vertex_change);
   assign  _net_107 = ((_stage_vertex_change_state_reg==_state_vertex_change__st2)&_stage_vertex_change);
   assign  _net_108 = (ty2-ty1);
   assign  _net_109 = (_net_108[9]);
   assign  _net_110 = (_net_107&_net_109);
   assign  _net_111 = (_net_107&_net_109);
   assign  _net_112 = (_net_107&_net_109);
   assign  _net_113 = (_net_107&_net_109);
   assign  _net_114 = (_net_107&_net_109);
   assign  _net_115 = (_net_107&_net_109);
   assign  _net_116 = ((_stage_vertex_change_state_reg==_state_vertex_change__st3)&_stage_vertex_change);
   assign  _net_117 = (ty3-ty1);
   assign  _net_118 = (_net_117[9]);
   assign  _net_119 = (_net_116&_net_118);
   assign  _net_120 = (_net_116&_net_118);
   assign  _net_121 = (_net_116&_net_118);
   assign  _net_122 = (_net_116&_net_118);
   assign  _net_123 = (_net_116&_net_118);
   assign  _net_124 = (_net_116&_net_118);
   assign  _net_125 = ((_stage_vertex_change_state_reg==_state_vertex_change__st4)&_stage_vertex_change);
   assign  _net_126 = (ty3-ty2);
   assign  _net_127 = (_net_126[9]);
   assign  _net_128 = (_net_125&_net_127);
   assign  _net_129 = (_net_125&_net_127);
   assign  _net_130 = (_net_125&_net_127);
   assign  _net_131 = (_net_125&_net_127);
   assign  _net_132 = (_net_125&_net_127);
   assign  _net_133 = (_net_125&_net_127);
   assign  _net_134 = ((_stage_vertex_change_state_reg==_state_vertex_change__st5)&_stage_vertex_change);
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     y <= 10'b0000000000;
else if ((hblank_begin)) 
      y <= (scanline+10'b0000000001);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     x1 <= 10'b0000000000;
else if ((_net_134)) 
      x1 <= tx1;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     y1 <= 10'b0000000000;
else if ((_net_134)) 
      y1 <= ty1;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     r1 <= 8'b00000000;
else if ((_net_134)) 
      r1 <= (tc1[23:16]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     g1 <= 8'b00000000;
else if ((_net_134)) 
      g1 <= (tc1[15:8]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     b1 <= 8'b00000000;
else if ((_net_134)) 
      b1 <= (tc1[7:0]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     x2 <= 10'b0000000000;
else if ((_net_134)) 
      x2 <= tx2;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     y2 <= 10'b0000000000;
else if ((_net_134)) 
      y2 <= ty2;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     r2 <= 8'b00000000;
else if ((_net_134)) 
      r2 <= (tc2[23:16]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     g2 <= 8'b00000000;
else if ((_net_134)) 
      g2 <= (tc2[15:8]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     b2 <= 8'b00000000;
else if ((_net_134)) 
      b2 <= (tc2[7:0]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     x3 <= 10'b0000000000;
else if ((_net_134)) 
      x3 <= tx3;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     y3 <= 10'b0000000000;
else if ((_net_134)) 
      y3 <= ty3;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     r3 <= 8'b00000000;
else if ((_net_134)) 
      r3 <= (tc3[23:16]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     g3 <= 8'b00000000;
else if ((_net_134)) 
      g3 <= (tc3[15:8]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     b3 <= 8'b00000000;
else if ((_net_134)) 
      b3 <= (tc3[7:0]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     sy <= 10'b0000000000;
else if ((_net_134)) 
      sy <= ty1;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ey <= 10'b0000000000;
else if ((_net_134)) 
      ey <= ty3;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     sx <= 10'b0000000000;
else if ((_net_61)|(_net_52)|(_net_50)|(_net_49)) 
      sx <= ((_net_61) ?10'b1010000000:10'b0)|
    ((_net_52) ?(x13[24:15]):10'b0)|
    ((_net_50) ?(x23[24:15]):10'b0)|
    ((_net_49) ?(x12[24:15]):10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ex <= 10'b0000000000;
else if ((_net_57)|(_net_56)|(_net_51)) 
      ex <= ((_net_57) ?(x23[24:15]):10'b0)|
    ((_net_56) ?(x12[24:15]):10'b0)|
    ((_net_51) ?(x13[24:15]):10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ar <= 16'b0000000000000000;
else if ((_net_65)) 
      ar <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ag <= 16'b0000000000000000;
else if ((_net_67)) 
      ag <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ab <= 16'b0000000000000000;
else if ((_net_69)) 
      ab <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     pr <= 16'b0000000000000000;
else if ((_net_69)|(_net_16)) 
      pr <= ((_net_69) ?({sr,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_16) ?(pr+ar):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     pg <= 16'b0000000000000000;
else if ((_net_69)|(_net_17)) 
      pg <= ((_net_69) ?({sg,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_17) ?(pg+ag):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     pb <= 16'b0000000000000000;
else if ((_net_69)|(_net_18)) 
      pb <= ((_net_69) ?({sb,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_18) ?(pb+ab):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     f_y_en <= 1'b0;
else if ((_net_9)|((_net_7|vblank_begin))) 
      f_y_en <= ((_net_9) ?1'b1:1'b0)|
    (((_net_7|vblank_begin)) ?1'b0:1'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     f_x_en <= 1'b0;
else if (((_net_44|_net_15))|(_net_13)) 
      f_x_en <= (((_net_44|_net_15)) ?1'b0:1'b0)|
    ((_net_13) ?1'b1:1'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     dbg_reg <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     tx1 <= 10'b0000000000;
else if ((_net_119)|(_net_110)|(_net_106)) 
      tx1 <= ((_net_119) ?tx3:10'b0)|
    ((_net_110) ?tx2:10'b0)|
    ((_net_106) ?vx1:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ty1 <= 10'b0000000000;
else if ((_net_120)|(_net_111)|(_net_106)) 
      ty1 <= ((_net_120) ?ty3:10'b0)|
    ((_net_111) ?ty2:10'b0)|
    ((_net_106) ?vy1:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     tc1 <= 24'b000000000000000000000000;
else if ((_net_121)|(_net_112)|(_net_106)) 
      tc1 <= ((_net_121) ?tc3:24'b0)|
    ((_net_112) ?tc2:24'b0)|
    ((_net_106) ?vc1:24'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     tx2 <= 10'b0000000000;
else if ((_net_128)|(_net_113)|(_net_106)) 
      tx2 <= ((_net_128) ?tx3:10'b0)|
    ((_net_113) ?tx1:10'b0)|
    ((_net_106) ?vx2:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ty2 <= 10'b0000000000;
else if ((_net_129)|(_net_114)|(_net_106)) 
      ty2 <= ((_net_129) ?ty3:10'b0)|
    ((_net_114) ?ty1:10'b0)|
    ((_net_106) ?vy2:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     tc2 <= 24'b000000000000000000000000;
else if ((_net_130)|(_net_115)|(_net_106)) 
      tc2 <= ((_net_130) ?tc3:24'b0)|
    ((_net_115) ?tc1:24'b0)|
    ((_net_106) ?vc2:24'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     tx3 <= 10'b0000000000;
else if ((_net_131)|(_net_122)|(_net_106)) 
      tx3 <= ((_net_131) ?tx2:10'b0)|
    ((_net_122) ?tx1:10'b0)|
    ((_net_106) ?vx3:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ty3 <= 10'b0000000000;
else if ((_net_132)|(_net_123)|(_net_106)) 
      ty3 <= ((_net_132) ?ty2:10'b0)|
    ((_net_123) ?ty1:10'b0)|
    ((_net_106) ?vy3:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     tc3 <= 24'b000000000000000000000000;
else if ((_net_133)|(_net_124)|(_net_106)) 
      tc3 <= ((_net_133) ?tc2:24'b0)|
    ((_net_124) ?tc1:24'b0)|
    ((_net_106) ?vc3:24'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     x12 <= 25'b0000000000000000000000000;
else if ((_net_81)|(_net_73)) 
      x12 <= ((_net_81) ?({x1,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):25'b0)|
    ((_net_73) ?(x12+ax12):25'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     x13 <= 25'b0000000000000000000000000;
else if ((_net_81)|(_net_69)) 
      x13 <= ((_net_81) ?({x1,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):25'b0)|
    ((_net_69) ?(x13+ax13):25'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     x23 <= 25'b0000000000000000000000000;
else if ((_net_81)|(_net_77)) 
      x23 <= ((_net_81) ?({x2,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):25'b0)|
    ((_net_77) ?(x23+ax23):25'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ax12 <= 25'b0000000000000000000000000;
else if ((_net_82)) 
      ax12 <= (_mulx_dout[39:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ax13 <= 25'b0000000000000000000000000;
else if ((_net_84)) 
      ax13 <= (_mulx_dout[39:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ax23 <= 25'b0000000000000000000000000;
else if ((_net_86)) 
      ax23 <= (_mulx_dout[39:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     r12 <= 16'b0000000000000000;
else if ((_net_104)|(_net_74)) 
      r12 <= ((_net_104) ?({r1,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_74) ?(r12+ar12):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     g12 <= 16'b0000000000000000;
else if ((_net_104)|(_net_75)) 
      g12 <= ((_net_104) ?({g1,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_75) ?(g12+ag12):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     b12 <= 16'b0000000000000000;
else if ((_net_104)|(_net_76)) 
      b12 <= ((_net_104) ?({b1,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_76) ?(b12+ab12):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     r13 <= 16'b0000000000000000;
else if ((_net_104)|(_net_69)) 
      r13 <= ((_net_104) ?({r1,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_69) ?(r13+ar13):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     g13 <= 16'b0000000000000000;
else if ((_net_104)|(_net_69)) 
      g13 <= ((_net_104) ?({g1,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_69) ?(g13+ag13):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     b13 <= 16'b0000000000000000;
else if ((_net_104)|(_net_69)) 
      b13 <= ((_net_104) ?({b1,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_69) ?(b13+ab13):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     r23 <= 16'b0000000000000000;
else if ((_net_104)|(_net_78)) 
      r23 <= ((_net_104) ?({r2,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_78) ?(r23+ar23):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     g23 <= 16'b0000000000000000;
else if ((_net_104)|(_net_79)) 
      g23 <= ((_net_104) ?({g2,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_79) ?(g23+ag23):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     b23 <= 16'b0000000000000000;
else if ((_net_104)|(_net_80)) 
      b23 <= ((_net_104) ?({b2,({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0}):16'b0)|
    ((_net_80) ?(b23+ab23):16'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ar12 <= 16'b0000000000000000;
else if ((_net_88)) 
      ar12 <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ag12 <= 16'b0000000000000000;
else if ((_net_90)) 
      ag12 <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ab12 <= 16'b0000000000000000;
else if ((_net_92)) 
      ab12 <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ar13 <= 16'b0000000000000000;
else if ((_net_94)) 
      ar13 <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ag13 <= 16'b0000000000000000;
else if ((_net_96)) 
      ag13 <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ab13 <= 16'b0000000000000000;
else if ((_net_98)) 
      ab13 <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ar23 <= 16'b0000000000000000;
else if ((_net_100)) 
      ar23 <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ag23 <= 16'b0000000000000000;
else if ((_net_102)) 
      ag23 <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     ab23 <= 16'b0000000000000000;
else if ((_net_104)) 
      ab23 <= (_mulc_dout[30:15]);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_bilinear_hbase <= 1'b0;
else if ((_net_0)) 
      _stage_bilinear_hbase <= _stage_bilinear_hbase_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _task_bilinear_hbase_do <= 1'b0;
else if ((_net_1)) 
      _task_bilinear_hbase_do <= _task_bilinear_hbase_do_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_bilinear_vbase <= 1'b0;
else if ((_net_2)) 
      _stage_bilinear_vbase <= _stage_bilinear_vbase_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _task_bilinear_vbase_do <= 1'b0;
else if ((_net_3)) 
      _task_bilinear_vbase_do <= _task_bilinear_vbase_do_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_vertex_change <= 1'b0;
else if ((_net_4)) 
      _stage_vertex_change <= _stage_vertex_change_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _task_vertex_change_do <= 1'b0;
else if ((_net_5)) 
      _task_vertex_change_do <= _task_vertex_change_do_set;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_bilinear_hbase_state_reg <= _state_bilinear_hbase__st1;
else if ((_net_67)|(_net_65)|(_net_64)|((_net_69|_net_62))|(_net_44)) 
      _stage_bilinear_hbase_state_reg <= ((_net_67) ?_state_bilinear_hbase__st_ab:3'b0)|
    ((_net_65) ?_state_bilinear_hbase__st_ag:3'b0)|
    ((_net_64) ?_state_bilinear_hbase__st_ar:3'b0)|
    (((_net_69|_net_62)) ?_state_bilinear_hbase__st1:3'b0)|
    ((_net_44) ?_state_bilinear_hbase__st2:3'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_bilinear_vbase_state_reg <= _state_bilinear_vbase__st1;
else if ((_net_104)|(_net_102)|(_net_100)|(_net_98)|(_net_96)|(_net_94)|(_net_92)|(_net_90)|(_net_88)|(_net_86)|(_net_84)|(_net_82)|(_net_81)) 
      _stage_bilinear_vbase_state_reg <= ((_net_104) ?_state_bilinear_vbase__st1:4'b0)|
    ((_net_102) ?_state_bilinear_vbase__st_ab23:4'b0)|
    ((_net_100) ?_state_bilinear_vbase__st_ag23:4'b0)|
    ((_net_98) ?_state_bilinear_vbase__st_ar23:4'b0)|
    ((_net_96) ?_state_bilinear_vbase__st_ab13:4'b0)|
    ((_net_94) ?_state_bilinear_vbase__st_ag13:4'b0)|
    ((_net_92) ?_state_bilinear_vbase__st_ar13:4'b0)|
    ((_net_90) ?_state_bilinear_vbase__st_ab12:4'b0)|
    ((_net_88) ?_state_bilinear_vbase__st_ag12:4'b0)|
    ((_net_86) ?_state_bilinear_vbase__st_ar12:4'b0)|
    ((_net_84) ?_state_bilinear_vbase__st_ax23:4'b0)|
    ((_net_82) ?_state_bilinear_vbase__st_ax13:4'b0)|
    ((_net_81) ?_state_bilinear_vbase__st_ax12:4'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _stage_vertex_change_state_reg <= _state_vertex_change__st1;
else if ((_net_134)|(_net_125)|(_net_116)|(_net_107)|(_net_106)) 
      _stage_vertex_change_state_reg <= ((_net_134) ?_state_vertex_change__st1:3'b0)|
    ((_net_125) ?_state_vertex_change__st5:3'b0)|
    ((_net_116) ?_state_vertex_change__st4:3'b0)|
    ((_net_107) ?_state_vertex_change__st3:3'b0)|
    ((_net_106) ?_state_vertex_change__st2:3'b0);

end
endmodule

/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:29 2019
 Licensed to :EVALUATION USER*/
