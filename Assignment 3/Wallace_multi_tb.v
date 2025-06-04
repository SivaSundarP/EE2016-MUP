`timescale 1ns / 1ps  // Define time units for the simulation

module Wallace_multi_tb;
    // Declare testbench variables
    reg [3:0] a, b;       // 4-bit inputs
    wire [7:0] m;         // 8-bit output

    // Instantiate the module under test (unsigned_mult)
    Wallace_multi uut (
        .a(a),
        .b(b),
        .m(m)
    );

    // Testbench procedure
    initial begin
        // Initialize inputs
        a = 4'b0000; b = 4'b0000;  // Test case: 0 * 0
        #10;  

        a = 4'b1101; b = 4'b1010;  // Test case: 13 * 10
        #10;

        a = 4'b1111; b = 4'b1111;  // Test case: 15 * 15
        #10;

        a = 4'b1001; b = 4'b0011;  // Test case: 9 * 3
        #10;

        a = 4'b0110; b = 4'b0101;  // Test case: 6 * 5
        #10;

        a = 4'b0101; b = 4'b0010;  // Test case: 5 * 2
        #10;

        $finish
    end

endmodule
