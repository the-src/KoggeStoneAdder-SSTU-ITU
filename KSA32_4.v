module KSA32_4(
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

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) 
        begin : cells_block_1
            cells cll_inst(
                .P_i(P_i[i+4]),
                .P_j(P_i[i]),
                .G_i(G_i[i+4]),
                .G_j(G_i[i]),
                .P_o(P_o[i+4]),
                .G_o(G_o[i+4])
            );
        end
    endgenerate

    genvar k;
    generate
        for (k = 4; k < 28; k = k + 1) 
        begin : cells_block_2
            cells cll_inst(
                .P_i(P_i[k+4]),
                .P_j(P_i[k]),
                .G_i(G_i[k+4]),
                .G_j(G_i[k]),
                .P_o(P_o[k+4]),
                .G_o(G_o[k+4])
            );
        end
    endgenerate


endmodule
