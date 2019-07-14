
/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:26 2019
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module chatmask ( p_reset , m_clock , bout , bin );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  output bout;
  wire bout;
  input bin;
  wire bin;
  reg bin_reg;
  reg bout_reg;
  reg [7:0] count;
  wire _net_0;
  wire _net_1;
  wire _net_2;

   assign  bout = bout_reg;
   assign  _net_0 = (bin_reg==bin);
   assign  _net_1 = (~_net_0);
   assign  _net_2 = (count[7]);
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     bin_reg <= 1'b0;
else   bin_reg <= bin;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     bout_reg <= 1'b0;
else if ((_net_2)) 
      bout_reg <= bin_reg;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     count <= 8'b00000000;
else if ((_net_1)|(_net_0)) 
      count <= ((_net_1) ?8'b00000000:8'b0)|
    ((_net_0) ?(count+8'b00000001):8'b0);

end
endmodule

/*Produced by sfl2vl, IP ARCH, Inc. Sun Jul 14 18:45:26 2019
 Licensed to :EVALUATION USER*/
