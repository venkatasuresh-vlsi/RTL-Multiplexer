module mux4x1(
     input [3:0] in,
	 input [1:0] sel,
	 output out
	 );
	 assign out = (sel == 2'b00) ? in[0] : 
	              (sel == 2'b01) ? in[1] :
				  (sel == 2'b10) ? in[2] : in[3];
	endmodule			  
	
module mux64x1 (
     input [63:0] in,
	 input [5:0] sel,
	 output out
	 );
	 wire [15:0] level1;
	 wire [3:0] level2;
	 wire level3;
	 
	 genvar i;
	 
	 generate 
	     for (i=0; i<16; i=i+1) begin
		     mux4x1 mux1 (
			     .in({in[4*i+3], in[4*i+2], in[4*i+1], in[4*i]}),
				 .sel(sel[1:0]),
				 .out(level1[i])
				 );
			end
		endgenerate
	  
	  generate 
	       for (i=0; i<4; i=i+1) begin
		     mux4x1 mux2 (
			     .in({level1[4*i+3], level1[4*i+2], level1[4*i+1], level1[4*i]}),
				 .sel(sel[3:2]),
				 .out(level2[i])
				 );
			end
		endgenerate
	 
	 mux4x1 mux3(
	     .in(level2),
		 .sel(sel[5:4]),
		 .out(level3)
		 );
	 assign out = level3;
	endmodule