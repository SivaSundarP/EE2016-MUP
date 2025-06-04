`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2024 22:22:49
// Design Name: 
// Module Name: Lcd_display
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

module Lcd_display(
    input out_clk,
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [7:0] P,
    input reset,
    
    output reg [7:0] data,
    output reg lcd_rs,
    output lcd_e
    );

reg [31:0] count = 0;

wire [7:0] ascii_A[3:0]; 
wire [7:0] ascii_B[3:0]; 
wire [7:0] ascii_P[7:0];

Ascii8 AS1(.In(A[0]), .Asc(ascii_A[0]));
Ascii8 AS2 (.In(A[1]), .Asc(ascii_A[1]));
Ascii8 AS3 (.In(A[2]), .Asc(ascii_A[2]));
Ascii8 AS4 (.In(A[3]), .Asc(ascii_A[3]));
Ascii8 AS5 (.In(B[0]), .Asc(ascii_B[0]));
Ascii8 AS6 (.In(B[1]), .Asc(ascii_B[1]));
Ascii8 AS7 (.In(B[2]), .Asc(ascii_B[2]));
Ascii8 AS8 (.In(B[3]), .Asc(ascii_B[3]));  
Ascii8 AS9 (.In(P[0]), .Asc(ascii_P[0]));
Ascii8 AS10 (.In(P[1]), .Asc(ascii_P[1]));
Ascii8 AS11 (.In(P[2]), .Asc(ascii_P[2]));
Ascii8 AS12 (.In(P[3]), .Asc(ascii_P[3]));
Ascii8 AS13 (.In(P[4]), .Asc(ascii_P[4]));
Ascii8 AS14 (.In(P[5]), .Asc(ascii_P[5]));
Ascii8 AS15 (.In(P[6]), .Asc(ascii_P[6]));
Ascii8 AS16 (.In(P[7]), .Asc(ascii_P[7]));

assign lcd_e = out_clk;

always @(posedge out_clk) begin
        case (count)
            0: begin
                lcd_rs = 0;         // Command mode
                data = 8'h38;       // Function set: 2 lines, 5x7 matrix
            end
            1: begin
                lcd_rs = 0;
                data = 8'h0C;       // Display ON, cursor OFF
            end
            2: begin
                lcd_rs = 0;
                data = 8'h06;       // Entry mode set: cursor move right
            end
            3: begin
                lcd_rs = 0;
                data = 8'h01;       // Clear display
            end
            4: begin
                lcd_rs = 0;
                data = 8'h80;       // Set cursor to start of 1st line
            end
            5: begin
                lcd_rs = 1;         // Data mode
                data = 8'h50;       // ASCII 'P'
            end
            6: begin
                lcd_rs = 1;
                data = 8'h52;       // ASCII 'R'
            end
            7: begin
                lcd_rs = 1;
                data = 8'h2E;       // ASCII '.'
            end
            8: begin
                lcd_rs = 1;
                data = 8'h4F;       // ASCII 'O'
            end
            9: begin
                lcd_rs = 1;
                data = 8'h46;       // ASCII 'F'
            end
            10: begin
                lcd_rs = 0;
                data = 8'h06;       // Entry mode set: cursor move right
            end
            11: begin
                lcd_rs = 1;
                data = ascii_A[3]; // Display A[3]
            end
            12: begin
                lcd_rs = 1;
                data = ascii_A[2]; // Display A[2]
            end
            13: begin
                lcd_rs = 1;
                data = ascii_A[1]; // Display A[1]
            end
            14: begin
                lcd_rs = 1;
                data = ascii_A[0]; // Display A[0]
            end
            15: begin
                lcd_rs = 1;
                data = 8'h26;       // ASCII '&'
            end
            16: begin
                lcd_rs = 1;
                data = ascii_B[3]; // Display B[3]
            end
            17: begin
                lcd_rs = 1;
                data = ascii_B[2]; // Display B[2]
            end
            18: begin
                lcd_rs = 1;
                data = ascii_B[1]; // Display B[1]
            end
            19: begin
                lcd_rs = 1;
                data = ascii_B[0]; // Display B[0]
            end
            20: begin
                lcd_rs = 0;
                data = 8'hC0;       // Set cursor to start of 2nd line
            end
            21: begin
                lcd_rs = 1;
                data = 8'h3D;       // ASCII '='
            end
            22: begin
                lcd_rs = 1;
                data = ascii_P[7]; // Display P[7]
            end
            23: begin
                lcd_rs = 1;
                data = ascii_P[6]; // Display P[6]
            end
            24: begin
                lcd_rs = 1;
                data = ascii_P[5]; // Display P[5]
            end
            25: begin
                lcd_rs = 1;
                data = ascii_P[4]; // Display P[4]
            end
            26: begin
                lcd_rs = 1;
                data = ascii_P[3]; // Display P[3]
            end
            27: begin
                lcd_rs = 1;
                data = ascii_P[2]; // Display P[2]
            end
            28: begin
                lcd_rs = 1;
                data = ascii_P[1]; // Display P[1]
            end
            29: begin
                lcd_rs = 1;
                data = ascii_P[0]; // Display P[0]
            end
            default: begin
                lcd_rs = 0;
                data = 8'h80;        
            end
        endcase

        count <= count + 1;
    end

endmodule