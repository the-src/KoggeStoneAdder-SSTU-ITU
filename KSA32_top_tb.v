`timescale 1ns/1ps

module KSA32_tb;

    // Inputs to the DUT
    reg [31:0] A, B;

    // Outputs from the DUT
    wire [31:0] SUM;
    wire COUT;
    wire overflow;

    // Expected outputs
    reg [31:0] SUM_exp;

    // File handling variables
    integer fd_in, fd_out;
    integer status;

    // Instantiate the DUT (Device Under Test)
    KSA32_top uut (
        .A(A),
        .B(B),
        .SUM(SUM),
        .COUT(COUT),
        .overflow(overflow)
    );

    initial begin
        // Open stimulus file and output file
        fd_in = $fopen("test_vectors.txt", "r");
        fd_out = $fopen("results.txt", "w");
        
        if (fd_in == 0) begin
            $display("Error: Could not open input file.");
            $finish;
        end
        if (fd_out == 0) begin
            $display("Error: Could not open output file.");
            $finish;
        end

        // Display header in results file
        $fwrite(fd_out, "Testbench Results:\n");

        // Read input pairs from stimulus file and apply them to DUT
        while (!$feof(fd_in)) begin
            status = $fscanf(fd_in, "%b %b %b\n", A, B, SUM_exp); // Read A, B, SUM_exp
            if (status != 3) begin
                $display("Error: Incorrect format in stimulus file.");
                $finish;
            end

            // Wait for the results
            #10;

            // Write results to output file and TCL CONSOLE as well
            $write("A=%0d, B=%0d, SUM_exp=%0d, ", A, B, SUM_exp);
            $write("SUM=%0d, COUT=%0d, overflow=%0d, ", SUM, COUT, overflow);
            if (SUM == SUM_exp)
                $write("status=TRUE\n");
            else
                $write("status=FALSE\n");
            
            $fwrite(fd_out, "A=\"bin=%b, dec=%0d\"; ", A, A);
            $fwrite(fd_out, "B=\"bin=%b, dec=%0d\"; ", B, B);
            $fwrite(fd_out, "SUM=\"bin=%b, dec=%0d\"; ", SUM, SUM);
            $fwrite(fd_out, "SUM_exp=\"bin=%b, dec=%0d\"; ", SUM_exp, SUM_exp);
            if (SUM == SUM_exp)
                $fwrite(fd_out, "status=TRUE\n");
            else
                $fwrite(fd_out, "status=FALSE\n");
        end

        // Close files
        $fclose(fd_in);
        $fclose(fd_out);

        $display("Testbench completed. Results written to results.txt.");
        $finish;
    end

endmodule
