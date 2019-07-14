
module mul_s25x16 (
	a, b, dout, con
);
	input signed [24:0] a;
	input signed [15:0] b;
	output signed [40:0] dout;
	input con;

	// •„†•t‚« s25 x s16 = s41
	assign dout = a * b;

endmodule
