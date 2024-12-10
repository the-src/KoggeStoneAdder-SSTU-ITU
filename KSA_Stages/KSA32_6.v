module KSA32_6(
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

    // No operation for g8 & p8
    assign G_o[8] = G_i[8];
    assign P_o[8] = P_i[8];

    // No operation for g9 & p9
    assign G_o[9] = G_i[9];
    assign P_o[9] = P_i[9];

    // No operation for g10 & p10
    assign G_o[10] = G_i[10];
    assign P_o[10] = P_i[10];

    // No operation for g11 & p11
    assign G_o[11] = G_i[11];
    assign P_o[11] = P_i[11];

    // No operation for g12 & p12
    assign G_o[12] = G_i[12];
    assign P_o[12] = P_i[12];

    // No operation for g13 & p13
    assign G_o[13] = G_i[13];
    assign P_o[13] = P_i[13];

    // No operation for g14 & p14
    assign G_o[14] = G_i[14];
    assign P_o[14] = P_i[14];

    // No operation for g15 & p15
    assign G_o[15] = G_i[15];
    assign P_o[15] = P_i[15];




    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1)
        begin: cells_block
            cells cll_inst_sec(
                .P_i(P_i[i+16]),
                .P_j(P_i[i]),
                .G_i(G_i[i+16]),
                .G_j(G_i[i]),
                .P_o(P_o[i+16]),
                .G_o(G_o[i+16])
            );
        end
    endgenerate

endmodule
