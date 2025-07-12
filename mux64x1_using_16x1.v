module mux16x1 (
		input  [15:0] in,
		input  [3:0] sel,
		output reg out
	 );
		always @(*) begin
			case (sel)
				4'd0:  out = in[0];
				4'd1:  out = in[1];
				4'd2:  out = in[2];
				4'd3:  out = in[3];
				4'd4:  out = in[4];
				4'd5:  out = in[5];
				4'd6:  out = in[6];
				4'd7:  out = in[7];
				4'd8:  out = in[8];
				4'd9:  out = in[9];
				4'd10: out = in[10];
				4'd11: out = in[11];
				4'd12: out = in[12];
				4'd13: out = in[13];
				4'd14: out = in[14];
				4'd15: out = in[15];
			endcase
		end
	endmodule

module mux64x1 (
		input  [63:0] in,
		input  [5:0]  sel,
		output        out
	 );
		wire [3:0] level1;              
		wire       level2;             

		genvar i;

		// Level 1
		generate
			for (i = 0; i < 4; i = i + 1) begin : gen_mux16
				mux16x1 m (
					.in({in[16*i+15], in[16*i+14], in[16*i+13], in[16*i+12],
						 in[16*i+11], in[16*i+10], in[16*i+9],  in[16*i+8],
						 in[16*i+7],  in[16*i+6],  in[16*i+5],  in[16*i+4],
						 in[16*i+3],  in[16*i+2],  in[16*i+1],  in[16*i]}),
					.sel(sel[3:0]),
					.out(level1[i])
				);
			end
		endgenerate

		// level 2
		assign level2 = (sel[5:4] == 2'b00) ? level1[0] :
						(sel[5:4] == 2'b01) ? level1[1] :
						(sel[5:4] == 2'b10) ? level1[2] : level1[3];

		assign out = level2;

	endmodule
