module mux8x1 (
     input  [7:0] in,
     input  [2:0] sel,
     output out
     );
     assign out = (sel == 3'b000) ? in[0] :
                  (sel == 3'b001) ? in[1] :
                  (sel == 3'b010) ? in[2] :
                  (sel == 3'b011) ? in[3] :
                  (sel == 3'b100) ? in[4] :
                  (sel == 3'b101) ? in[5] :
                  (sel == 3'b110) ? in[6] :
                                    in[7];
    endmodule
module mux64x1 (
     input  [63:0] in,
     input  [5:0] sel,
     output out
     );
     wire [7:0] level1;
     wire level2;

     genvar i;
     generate
         for (i = 0; i < 8; i = i + 1) begin 
             mux8x1 mmux1 (
                 .in({in[8*i+7], in[8*i+6], in[8*i+5], in[8*i+4],
                     in[8*i+3], in[8*i+2], in[8*i+1], in[8*i]}),
                 .sel(sel[2:0]),
                 .out(level1[i])
                  );
            end
        endgenerate

     mux8x1 mux2 (
         .in(level1),
         .sel(sel[5:3]),
         .out(level2)
          );
	 assign out = level2;
    endmodule
