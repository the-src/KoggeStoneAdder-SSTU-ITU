module cells(
    input wire P_i,
    input wire P_j,
    input wire G_i,
    input wire G_j,
    output wire P_o,
    output wire G_o
);

    assign P_o = P_i & P_j;
    assign G_o = G_i | (P_i & G_j);

endmodule