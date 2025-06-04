`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 14:55:16
// Design Name: 
// Module Name: Full_Add
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


module Full_Add_tb;
reg I1;
reg I2;
reg C_in;

wire S;
wire C_out;

Full_Add uut (
    .I1(I1),
    .I2(I2),
    .C_in(C_in),
    .S(S),
    .C_out(C_out)
    );
    
initial begin 

I1 = 0;
I2 = 0;
C_in = 0;
#10;

I1 = 1;
I2 = 0;
C_in = 0;
#10;

I1 = 0;
I2 = 0;
C_in = 1;
#10;

I1 = 0;
I2 = 1;
C_in = 0;
#10;

I1 = 1;
I2 = 0;
C_in = 1;
#10;

I1 = 0;
I2 = 1;
C_in = 1;
#10;

I1 = 1;
I2 = 1;
C_in = 0;
#10;

I1 = 1;
I2 = 1;
C_in = 1;
#10;
$finish;
end
   
endmodule
