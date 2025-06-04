`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 17:58:51
// Design Name: 
// Module Name: Ripple_Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Ripple_Adder(
    input [3:0] A,
    input [3:0] B,
    input C_in,
    output [3:0] S,
    output C_out
    );
    wire C1,C2,C3;

Full_Add2 S1(
    .I1(A[0]),
    .I2(B[0]),
    .C_in(C_in),
    .S(S[0]),
    .C_out(C1)
    );

Full_Add2 S2(
    .I1(A[1]),
    .I2(B[1]),
    .C_in(C1),
    .S(S[1]),
    .C_out(C2)
    );
    
Full_Add2 S3(
    .I1(A[2]),
    .I2(B[2]),
    .C_in(C2),
    .S(S[2]),
    .C_out(C3)
    );
    
Full_Add2 S4(
    .I1(A[3]),
    .I2(B[3]),
    .C_in(C3),
    .S(S[3]),
    .C_out(C_out)
    );
        
endmodule
