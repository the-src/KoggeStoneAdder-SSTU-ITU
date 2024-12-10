module KSA32_5(
    input wire [31:0] P_i, // 32-bit input operand P_i
    input wire [31:0] G_i, // 32-bit input operand G_i
    output wire [31:0] G_o, // 32-bit output G_o
    output wire [31:0] P_o // 32-bit output P_o
);

    // No operation for g0 & p0
    assign G_o[0] = G_i[0];
    assign P_o[0] = P_i[0];

    // No operation for g1 & p1
    assign G_o[1] = G_i[1];
    assign P_o[1] = P_i[1];

    // No operation for g2 & p2
    assign G_o[2] = G_i[2];
    assign P_o[2] = P_i[2];

    // No operation for g3 & p3
    assign G_o[3] = G_i[3];
    assign P_o[3] = P_i[3];

    // No operation for g4 & p4
    assign G_o[4] = G_i[4];
    assign P_o[4] = P_i[4];
    
    // No operation for g5 & p5
    assign G_o[5] = G_i[5];
    assign P_o[5] = P_i[5];

    // No operation for g6 & p6
    assign G_o[6] = G_i[6];
    assign P_o[6] = P_i[6];

    // No operation for g7 & p7
    assign G_o[7] = G_i[7];
    assign P_o[7] = P_i[7];


    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1)
        begin: cells_block_1
            cells cll_inst(
                .P_i(P_i[i+8]),
                .P_j(P_i[i]),
                .G_i(G_i[i+8]),
                .G_j(G_i[i]),
                .P_o(P_o[i+8]),
                .G_o(G_o[i+8])
            );
        end
    endgenerate

    genvar k;
    generate
        for (k = 8; k < 24; k = k + 1)
        begin: cells_block_2
            cells cll_inst(
                .P_i(P_i[k+8]),
                .P_j(P_i[k]),
                .G_i(G_i[k+8]),
                .G_j(G_i[k]),
                .P_o(P_o[k+8]),
                .G_o(G_o[k+8])
            );
        end
    endgenerate


endmodule
