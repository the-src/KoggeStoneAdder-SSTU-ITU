module KSA32_1(
    input wire [31:0] A, // 32-bit input operand A
    input wire [31:0] B, // 32-bit input operand B
    output wire [31:0] P_i, // 32-bit output P_i
    output wire [31:0] G_i // 32-bit output G_i
);
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) 
        begin: gp_block
            gp_block gp_inst(
                .A_i(A[i]),
                .B_i(B[i]),
                .P_i(P_i[i]),
                .G_i(G_i[i])
            );
        end
    endgenerate

endmodule
