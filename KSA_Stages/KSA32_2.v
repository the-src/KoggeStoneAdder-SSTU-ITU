module KSA32_2(
    input wire [31:0] P_i, // 32-bit input operand P_i
    input wire [31:0] G_i, // 32-bit input operand G_i
    output wire [31:0] G_o, // 32-bit output G_o
    output wire [31:0] P_o // 32-bit output P_o
);

    assign G_o[0] = G_i[0];
    assign P_o[0] = P_i[0];

    genvar i;
    generate
        for (i = 0; i < 31; i = i + 1) 
        begin : cells_block
            cells cll_inst(
                .P_i(P_i[i+1]),
                .P_j(P_i[i]),
                .G_i(G_i[i+1]),
                .G_j(G_i[i]),
                .P_o(P_o[i+1]),
                .G_o(G_o[i+1])
            );
        end
    endgenerate


endmodule
