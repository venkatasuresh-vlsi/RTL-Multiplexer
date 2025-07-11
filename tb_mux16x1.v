module tb_mux16x1;
     reg [15:0] in;
     reg [3:0] sel;
     wire out;
     integer i, j;

     mux16x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
     );

     initial begin
         $monitor("Time=%0t | sel=%b | in=%b | out=%b", $time, sel, in, out);
             for (i = 0; i < 16; i = i + 1) begin       
                 for (j = 0; j < 128; j = j + 1) begin  
					 sel = i[3:0];
					 in = j[15:0];
					 #10;
                    end
                end
            $finish;
        end
    endmodule
