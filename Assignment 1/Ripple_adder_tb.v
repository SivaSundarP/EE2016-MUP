`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 18:19:28
// Design Name: 
// Module Name: Ripple_adder_tb
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


module Ripple_adder_tb ;

reg [3:0] A;
reg [3:0] B;
reg C_in;

wire [3:0] S;
wire C_out;

Ripple_Adder uut (
     .A(A),
     .B(B),
     .C_in(C_in),
     .S(S),
     .C_out(C_out)
     );
 
initial begin 

A = 4'b0000;
B = 4'b0000;
C_in = 0;
#10

A = 4'b0001;
B = 4'b0000;
C_in = 0;
#10

A = 4'b0000;
B = 4'b0001;
C_in = 1;
#10

A = 4'b0001;
B = 4'b0001;
C_in = 1;
#10

A = 4'b0011;
B = 4'b0111;
C_in = 0;
#10

A = 4'b0011;
B = 4'b0011;
C_in = 1;
#10
A = 4'b0100;
B = 4'b1001;
C_in = 1;
#10
A = 4'b1110;
B = 4'b0011;
C_in = 0;
#10
A = 4'b1111;
B = 4'b1111;
C_in = 1;
#10

$finish;
end

endmodule
