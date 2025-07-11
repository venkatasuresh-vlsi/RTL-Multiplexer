module tb_mux4x1;
     reg [3:0] in;
     reg [1:0] sel;
     wire out;
     integer i, j;
	 
     mux4x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
     );

     initial begin
        $monitor("Time=%0t | in=%b |  sel=%b | out=%b", $time, sel, in, out);
             for (i=0; i<4; i=i+1) begin
			     for (j=0; j<16; j=j+1) begin
				     sel = i[1:0]; in = j[7:0];
					 #10;
					end
				end
        $finish;
    end
endmodule
