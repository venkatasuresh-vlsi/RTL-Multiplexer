module tb_mux32x1;
    reg [31:0] in;
    reg [4:0] sel;
    wire out;
    integer i, j;

    mux32x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $monitor("Time=%0t | sel=%b | in=%b | out=%b", $time, sel, in, out);
        for (i = 0; i < 32; i = i + 1) begin           
            for (j = 0; j < 256; j = j + 1) begin      
                sel = i[4:0];
                in = j[7:0];                          
                #10;
            end
        end
        $finish;
    end
endmodule
