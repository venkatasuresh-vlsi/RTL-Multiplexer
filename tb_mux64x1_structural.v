module tb_mux64x1;
    reg [63:0] in;
    reg [5:0] sel;
    wire out;

    integer i, j;

    mux64x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $monitor("Time=%0t | sel=%b | in=%b | out=%b", $time, sel, in, out);
        for (i = 0; i < 64; i = i + 1) begin         
            for (j = 0; j < 256; j = j + 1) begin     
                sel = i[5:0];
                in = 64'b0;
                in[i] = j[0];
                #10;
            end
        end
        $finish;
    end
endmodule
