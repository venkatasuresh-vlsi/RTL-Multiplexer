module tb_mux64x1;
     reg  [63:0] in;
     reg  [5:0]  sel;
     wire        out;

     mux64x1 dut (
        .in(in),
        .sel(sel),
        .out(out)
     );

     integer i;
 
     initial begin
         $monitor("Time=%0t | in=%b | sel=%b | out=%b", $time, sel, in, out);
		     in = 64'h0123_4567_89ab_cdef;
             for (i = 0; i < 64; i = i + 1) begin
                 sel = i;
                 #10;
            end
            $finish;
        end
    endmodule
