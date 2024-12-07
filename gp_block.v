module gp_block(
    input wire A_i,
    input wire B_i,
    output wire P_i,
    output wire G_i
);

    assign P_i = A_i ^ B_i;
    assign G_i = A_i & B_i;

endmodule
