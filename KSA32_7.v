module KSA32_7(
    input wire [31:0] P_i, // 32-bit input operand P_i
    input wire [31:0] G_i, // 32-bit input operand G_i
    output wire [32:0] C_o // 33-bit output carry C_o
);

    // Initial carry-in is 0
    assign C_o[0] = 0;

    genvar i;
    generate
        for (i = 1; i < 33; i = i + 1)
        begin
            assign C_o[i] = G_i[i-1] | (P_i[i-1] & C_o[i-1]);
        end
    endgenerate    

endmodule