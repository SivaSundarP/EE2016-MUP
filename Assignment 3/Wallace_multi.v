module Wallace_multi (a , b ,m);
    input [3:0] a, b;    // 4-bit inputs
    output [7:0] m;      // 8-bit output
    wire [3:0] p0, p1, p2, p3; // Partial products
    wire s5, s4, s3, s2, s1, s0; // Sum bits
    wire c5, c4, c3, c2, c1, c0; // Carry bits

    // Generate partial products
    assign p0 = a & {4{b[0]}}; // p0 = a * b[0]
    assign p1 = a & {4{b[1]}}; // p1 = a * b[1]
    assign p2 = a & {4{b[2]}}; // p2 = a * b[2]
    assign p3 = a & {4{b[3]}}; // p3 = a * b[3]

    // Stage 1: Add partial products using half and full adders
    // p0:  a0b0 a1b0 a2b0 a3b0
    // p1:  a0b1 a1b1 a2b1 a3b1
    // p2:  a0b2 a1b2 a2b2 a3b2
    // p3:  a0b3 a1b3 a2b3 a3b3

    // First row
    assign m[0] = p0[0];

    // Second row
    Half_adder ha1(p0[1], p1[0], s0, c0);
    Full_Add2 fa1(p0[2], p1[1], p2[0], s1, c1);
    Full_Add2 fa2(p0[3], p1[2], p2[1], s2, c2);
    Half_adder ha2(p1[3], p2[2], s3, c3);

    // Third row
    Full_Add2 fa3(s1, c0, p3[0], m[1], c4);
    Full_Add2 fa4(s2, c1, p3[1], s4, c5);
    Full_Add2 fa5(s3, c2, p3[2], s5, c6);

    // Fourth row
    Half_adder ha3(c3, p3[3], m[5], c7);

    // Final summation
    Half_adder ha4(s4, c4, m[2], c8);
    Full_Add2 fa6(s5, c5, c8, m[3], c9);
    Full_Add2 fa7(m[5], c6, c9, m[4], m[6]);
    assign m[7] = c7 | c9; // Final carry out

endmodule