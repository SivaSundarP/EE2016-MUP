`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2024 12:20:50
// Design Name: 
// Module Name: Ascii8
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


module Ascii8(
    input In,
    output reg [7:0] Asc
    );
    always @(*) begin
    if (In == 1'b0) begin
        Asc = 8'b00110000;  
    end else begin
        Asc = 8'b00110001;
    end
end
endmodule
