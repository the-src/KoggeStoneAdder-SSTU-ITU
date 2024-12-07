`timescale 1ns/1ps

module KSA32_top(
    input [31:0] A, // 32-bit input operand A
    input [31:0] B, // 32-bit input operand B
    output [31:0] SUM, // 32-bit sum output
    output COUT,       // carry-out
    output overflow    // overflow output
);

    wire [31:0] P1_i, P2_i, P3_i, P4_i, P5_i, P6_i;
    wire [31:0] G1_i, G2_i, G3_i, G4_i, G5_i, G6_i;
    wire [32:0] carry;

    // Instantiate Kogge-Stone Adder stages
    KSA32_1 Stage1(.A(A), .B(B), .P_i(P1_i), .G_i(G1_i));
    KSA32_2 Stage2(.P_i(P1_i), .G_i(G1_i), .P_o(P2_i), .G_o(G2_i));
    KSA32_3 Stage3(.P_i(P2_i), .G_i(G2_i), .P_o(P3_i), .G_o(G3_i));
    KSA32_4 Stage4(.P_i(P3_i), .G_i(G3_i), .P_o(P4_i), .G_o(G4_i));
    KSA32_5 Stage5(.P_i(P4_i), .G_i(G4_i), .P_o(P5_i), .G_o(G5_i));
    KSA32_6 Stage6(.P_i(P5_i), .G_i(G5_i), .P_o(P6_i), .G_o(G6_i));
    KSA32_7 Stage7(.P_i(P6_i), .G_i(G6_i), .C_o(carry));

    assign COUT = carry[32];
    assign SUM = P1_i ^ carry[31:0];
    assign overflow = carry[32] ^ carry[31];

endmodule