module tb_mux2x1;
     reg a, b, sel;
     wire y;

     mux2x1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
     );
    initial begin
	  $monitor("Time=%0t | a=%b | b=%b | sel=%b | y=%b", $time, a, b, sel, y); 
         a = 0; b = 0; sel = 0;
         a = 0; b = 1; sel = 0;
         a = 1; b = 0; sel = 1;
         a = 1; b = 1; sel = 1;
        $finish;
    end

endmodule
