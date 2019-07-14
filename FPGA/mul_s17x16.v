
module mul_s17x16 (
	a, b, dout, con
);
	input signed [16:0] a;
	input signed [15:0] b;
	output signed [32:0] dout;
	input con;

	// •„†•t‚« s17 x s16 = s33
	assign dout = a * b;

endmodule
