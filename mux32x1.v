module mux32x1 (
     input wire [31:0] in,
     input wire [4:0] sel,   
     output reg out
     );
     always @(*) begin
         case (sel)
				5'd0 : out = in[0];
				5'd1 : out = in[1];
				5'd2 : out = in[2];
				5'd3 : out = in[3];
				5'd4 : out = in[4];
				5'd5 : out = in[5];
				5'd6 : out = in[6];
				5'd7 : out = in[7];
				5'd8 : out = in[8];
				5'd9 : out = in[9];
				5'd10: out = in[10];
				5'd11: out = in[11];
				5'd12: out = in[12];
				5'd13: out = in[13];
				5'd14: out = in[14];
				5'd15: out = in[15];
				5'd16: out = in[16];
				5'd17: out = in[17];
				5'd18: out = in[18];
				5'd19: out = in[19];
				5'd20: out = in[20];
				5'd21: out = in[21];
				5'd22: out = in[22];
				5'd23: out = in[23];
				5'd24: out = in[24];
				5'd25: out = in[25];
				5'd26: out = in[26];
				5'd27: out = in[27];
				5'd28: out = in[28];
				5'd29: out = in[29];
				5'd30: out = in[30];
				5'd31: out = in[31];
				default: out = 1'b0;
             endcase
        end
    endmodule
