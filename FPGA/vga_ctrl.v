
/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:27 2019
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module vga_ctrl ( p_reset , m_clock , oR , oG , oB , iR , iG , iB , h_count , v_count , hblank_begin , vblank_begin , h_en , v_en , h_sync , v_sync , htiming );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  output [3:0] oR;
  wire [3:0] oR;
  output [3:0] oG;
  wire [3:0] oG;
  output [3:0] oB;
  wire [3:0] oB;
  input [3:0] iR;
  wire [3:0] iR;
  input [3:0] iG;
  wire [3:0] iG;
  input [3:0] iB;
  wire [3:0] iB;
  output [9:0] h_count;
  wire [9:0] h_count;
  output [9:0] v_count;
  wire [9:0] v_count;
  output hblank_begin;
  wire hblank_begin;
  output vblank_begin;
  wire vblank_begin;
  output h_en;
  wire h_en;
  output v_en;
  wire v_en;
  output h_sync;
  wire h_sync;
  output v_sync;
  wire v_sync;
  input htiming;
  wire htiming;
  reg [9:0] h_count_reg;
  reg [9:0] v_count_reg;
  reg [9:0] h_tim;
  reg [9:0] v_tim;
  reg h_sync_reg;
  reg v_sync_reg;
  reg h_en_reg;
  reg v_en_reg;
  wire vtiming;
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
  wire _net_10;
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

   assign  h_sync = h_sync_reg;
   assign  v_sync = v_sync_reg;
   assign  h_en = h_en_reg;
   assign  v_en = v_en_reg;
   assign  vblank_begin = _net_22;
   assign  hblank_begin = _net_6;
   assign  h_count = h_count_reg;
   assign  v_count = v_count_reg;
   assign  oR = ((_net_1)?4'b0000:4'b0)|
    ((_net_0)?iR:4'b0);
   assign  oG = ((_net_2)?4'b0000:4'b0)|
    ((_net_0)?iG:4'b0);
   assign  oB = ((_net_3)?4'b0000:4'b0)|
    ((_net_0)?iB:4'b0);
   assign  vtiming = _net_11;
   assign  _net_0 = (h_en&v_en);
   assign  _net_1 = (~_net_0);
   assign  _net_2 = (~_net_0);
   assign  _net_3 = (~_net_0);
   assign  _net_4 = (h_tim==10'b1100010000);
   assign  _net_5 = (htiming&_net_4);
   assign  _net_6 = (htiming&_net_4);
   assign  _net_7 = (h_tim==10'b0010010000);
   assign  _net_8 = (htiming&_net_7);
   assign  _net_9 = (h_tim==10'b0001100000);
   assign  _net_10 = (htiming&_net_9);
   assign  _net_11 = (htiming&_net_9);
   assign  _net_12 = (h_tim==10'b0000000000);
   assign  _net_13 = (htiming&_net_12);
   assign  _net_14 = (h_tim==10'b1100011111);
   assign  _net_15 = (htiming&_net_14);
   assign  _net_16 = (htiming&(~_net_14));
   assign  _net_17 = (h_tim==10'b0010010000);
   assign  _net_18 = (htiming&_net_17);
   assign  _net_19 = (htiming&(~_net_17));
   assign  _net_20 = (v_tim==10'b1000000011);
   assign  _net_21 = (vtiming&_net_20);
   assign  _net_22 = (vtiming&_net_20);
   assign  _net_23 = (v_tim==10'b0000100011);
   assign  _net_24 = (vtiming&_net_23);
   assign  _net_25 = (v_tim==10'b0000000010);
   assign  _net_26 = (vtiming&_net_25);
   assign  _net_27 = (v_tim==10'b0000000000);
   assign  _net_28 = (vtiming&_net_27);
   assign  _net_29 = (v_tim==10'b1000001100);
   assign  _net_30 = (vtiming&_net_29);
   assign  _net_31 = (vtiming&(~_net_29));
   assign  _net_32 = (v_tim==10'b0000100011);
   assign  _net_33 = (vtiming&_net_32);
   assign  _net_34 = (vtiming&(~_net_32));
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     h_count_reg <= 10'b0000000000;
else if ((_net_19)|(_net_18)) 
      h_count_reg <= ((_net_19) ?(h_count_reg+10'b0000000001):10'b0)|
    ((_net_18) ?10'b0000000000:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     v_count_reg <= 10'b0000000000;
else if ((_net_34)|(_net_33)) 
      v_count_reg <= ((_net_34) ?(v_count_reg+10'b0000000001):10'b0)|
    ((_net_33) ?10'b0000000000:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     h_tim <= 10'b0000000000;
else if ((_net_16)|(_net_15)) 
      h_tim <= ((_net_16) ?(h_tim+10'b0000000001):10'b0)|
    ((_net_15) ?10'b0000000000:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     v_tim <= 10'b0000000000;
else if ((_net_31)|(_net_30)) 
      v_tim <= ((_net_31) ?(v_tim+10'b0000000001):10'b0)|
    ((_net_30) ?10'b0000000000:10'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     h_sync_reg <= 1'b1;
else if ((_net_13)|(_net_10)) 
      h_sync_reg <= ((_net_13) ?1'b0:1'b0)|
    ((_net_10) ?1'b1:1'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     v_sync_reg <= 1'b1;
else if ((_net_28)|(_net_26)) 
      v_sync_reg <= ((_net_28) ?1'b0:1'b0)|
    ((_net_26) ?1'b1:1'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     h_en_reg <= 1'b0;
else if ((_net_8)|(_net_5)) 
      h_en_reg <= ((_net_8) ?1'b1:1'b0)|
    ((_net_5) ?1'b0:1'b0);

end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     v_en_reg <= 1'b0;
else if ((_net_24)|(_net_21)) 
      v_en_reg <= ((_net_24) ?1'b1:1'b0)|
    ((_net_21) ?1'b0:1'b0);

end
endmodule

/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:27 2019
 Licensed to :EVALUATION USER*/
