`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2024 15:30:42
// Design Name: 
// Module Name: Half_adder_th
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


module Half_adder_th ;
reg I1;
reg I2 ;

wire S ;
wire C ;
    
Half_adder uut (
        .I1(I1), 
        .I2(I2), 
        .S(S), 
        .C(C)
    );

initial begin 

I1=0;
I2=0;
#10;

I1=0;
I2=1;
#10;

I1=1;
I2=1;
#10;

I1=1;
I2=0;
#10;
$finish ;
end

endmodule
