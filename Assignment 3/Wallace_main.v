`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2024 23:27:51
// Design Name: 
// Module Name: Wallace_main
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

module Wallace_main(
    input [3:0] A,
    input [3:0] B,
    input reset,
    input in_Clk,
    
    output [7:0] P,
    output [7:0] data,
    output lcd_rs,
    output lcd_e
    );

reg [3:0] A_reg, B_reg;
reg prev_reset;
wire out_clk;

clk_divider clk (
     .inClk(in_Clk),
     .reset(reset),
     .outClk(out_clk)
     );

Wallace_multi wm (
.A(A_reg),
.B(B_reg),
.P(P)
);

Lcd_display ld (
.out_clk(out_clk),
.A(A_reg),
.B(B_reg),
.P(P),
.reset(reset),
.data(data),
.lcd_rs(lcd_rs),
.lcd_e(lcd_e)
);

always @(posedge in_Clk) begin   
    if (!prev_reset && reset) begin
        A_reg <= A;
        B_reg <= B;
    end
    prev_reset <= reset;
end

endmodule
