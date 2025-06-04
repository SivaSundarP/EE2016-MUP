`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 19:24:12
// Design Name: 
// Module Name: Full_Add2
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


module Full_Add2(
    input I1,
    input I2,
    input C_in,
    output C_out,
    output S
    );
    wire X1,A1,A2;
    assign X1 = I1 ^ I2 ;
    assign A1 = X1 & C_in ;
    assign A2 = I1 & I2 ;
    assign S = X1 ^ C_in ;
    assign C_out = A1 + A2 ;
endmodule
