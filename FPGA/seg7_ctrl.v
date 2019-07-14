
/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:27 2019
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module seg7_ctrl ( p_reset , m_clock , con , oSEG , iDIG );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input con;
  wire con;
  output [6:0] oSEG;
  wire [6:0] oSEG;
  input [3:0] iDIG;
  wire [3:0] iDIG;
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

   assign  oSEG = ((_net_15)?7'b1000000:7'b0)|
    ((_net_14)?7'b1111001:7'b0)|
    ((_net_13)?7'b0100100:7'b0)|
    ((_net_12)?7'b0110000:7'b0)|
    ((_net_11)?7'b0011001:7'b0)|
    ((_net_10)?7'b0010010:7'b0)|
    ((_net_9)?7'b0000010:7'b0)|
    ((_net_8)?7'b1111000:7'b0)|
    ((_net_7)?7'b0000000:7'b0)|
    ((_net_6)?7'b0010000:7'b0)|
    ((_net_5)?7'b0001000:7'b0)|
    ((_net_4)?7'b0000011:7'b0)|
    ((_net_3)?7'b1000110:7'b0)|
    ((_net_2)?7'b0100001:7'b0)|
    ((_net_1)?7'b0000110:7'b0)|
    ((_net_0)?7'b0001110:7'b0);
   assign  _net_0 = (iDIG==4'b1111);
   assign  _net_1 = (iDIG==4'b1110);
   assign  _net_2 = (iDIG==4'b1101);
   assign  _net_3 = (iDIG==4'b1100);
   assign  _net_4 = (iDIG==4'b1011);
   assign  _net_5 = (iDIG==4'b1010);
   assign  _net_6 = (iDIG==4'b1001);
   assign  _net_7 = (iDIG==4'b1000);
   assign  _net_8 = (iDIG==4'b0111);
   assign  _net_9 = (iDIG==4'b0110);
   assign  _net_10 = (iDIG==4'b0101);
   assign  _net_11 = (iDIG==4'b0100);
   assign  _net_12 = (iDIG==4'b0011);
   assign  _net_13 = (iDIG==4'b0010);
   assign  _net_14 = (iDIG==4'b0001);
   assign  _net_15 = (iDIG==4'b0000);
endmodule

/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:27 2019
 Licensed to :EVALUATION USER*/
