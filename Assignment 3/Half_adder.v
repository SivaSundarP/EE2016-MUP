`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2024 15:21:12
// Design Name: 
// Module Name: Half_adder
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


module Half_adder(
    input I1,
    input I2,
    output S,
    output C
    );
   
assign S = I1 ^ I2 ;
assign C = I1 & I2 ;

endmodule
