module mux32x1 (
     input [31:0] in,
	 input [4:0] sel,
	 output  out
	 );
	 assign out = in[sel];
	endmodule
module mux64x1 (
     input [63:0] in,
	 input [5:0] sel,
	 output out 
	 );
	 wire [1:0] level1;
	 wire level2;
	 
	 mux32x1 mux1 (
	     .in(in[31:0]),
		 .sel(sel[4:0]),
		 .out(level1[0])
		 );
	 mux32x1 mux2 (
	     .in(in[63:32]),
		 .sel(sel[4:0]),
		 .out(level1[1])
		 );	 
	 assign level2 = sel[5] ? level1[1] : level1[0];
	 assign out = level2;
	endmodule