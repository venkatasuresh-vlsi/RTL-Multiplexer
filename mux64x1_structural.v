module mux2x1 (
    input wire a,
    input wire b,
    input wire sel,
    output wire y
);
    assign y = sel ? b : a;
endmodule

module mux64x1 (
    input wire [63:0] in,   
    input wire [5:0] sel,   
    output wire out
);
    wire [31:0] level1;
    wire [15:0] level2;
    wire [7:0]  level3;
    wire [3:0]  level4;
    wire [1:0]  level5;
    wire        level6;

    genvar i;

    // Level 1
    generate
        for (i = 0; i < 32; i = i + 1) begin 
            mux2x1 m1 (
                .a(in[2*i]),
                .b(in[2*i + 1]),
                .sel(sel[0]),
                .y(level1[i])
            );
        end
    endgenerate

    // Level 2
    generate
        for (i = 0; i < 16; i = i + 1) begin 
            mux2x1 m2 (
                .a(level1[2*i]),
                .b(level1[2*i + 1]),
                .sel(sel[1]),
                .y(level2[i])
            );
        end
    endgenerate

    // Level 3
    generate
        for (i = 0; i < 8; i = i + 1) begin 
            mux2x1 m3 (
                .a(level2[2*i]),
                .b(level2[2*i + 1]),
                .sel(sel[2]),
                .y(level3[i])
            );
        end
    endgenerate

    // Level 4
    generate
        for (i = 0; i < 4; i = i + 1) begin 
            mux2x1 m4 (
                .a(level3[2*i]),
                .b(level3[2*i + 1]),
                .sel(sel[3]),
                .y(level4[i])
            );
        end
    endgenerate

    // Level 5
    generate
        for (i = 0; i < 2; i = i + 1) begin 
            mux2x1 m5 (
                .a(level4[2*i]),
                .b(level4[2*i + 1]),
                .sel(sel[4]),
                .y(level5[i])
            );
        end
    endgenerate

    // Level 6
    mux2x1 m6 (
        .a(level5[0]),
        .b(level5[1]),
        .sel(sel[5]),
        .y(out)
    );

endmodule
