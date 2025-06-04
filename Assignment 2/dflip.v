`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.08.2024 14:40:39
// Design Name: 
// Module Name: dflip
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


 module dflip;
     
  reg d ;
  reg clk ;
  reg rst ;
  
  wire q;
  wire qbar;

  dflipflop_withreset uut (
    .d(d),
    .clk(clk),
    .q(q),
    .qbar(qbar),
    .rst(rst)
  );

  always #5 clk = ~clk; 

  initial begin
    clk = 0;
    d = 0;
    rst=1;
    
    #10 
    d = 1;
    rst = 1;
    #10  
    d = 0;
    rst = 1;  
    #10
    d = 1;
    rst = 0; 
    #10 
    d = 0;
    rst = 1;
    #10 
    d = 1; 
    rst = 0;
    #10 

     $finish; 
  end
endmodule
