module lcd(in_Clk, lcd_rs, lcd_e, data);
input in_Clk;
output reg [7:0] data;
output reg lcd_rs;
output lcd_e;
wire [7:0] command [0:4];
reg [31:0] count = 0;
wire out_Clk;

assign command[0] = 8'h38; // Function Set: 2 lines, 5x7 dots
assign command[1] = 8'h0C; // Display On, Cursor Off, Blink Off
assign command[2] = 8'h06; // Entry Mode Set: Increment cursor
assign command[3] = 8'h01; // Clear Display
assign command[4] = 8'hC0; // Set DDRAM address to start of second line

clk_divider c0 (in_Clk, out_Clk);
assign lcd_e = out_Clk;

always @(posedge lcd_e) begin
    case (count)
        1: begin lcd_rs = 0; data = command[0]; end // Initialize LCD: Display on two lines
        2: begin lcd_rs = 0; data = command[1]; end // Keep display on but cursor off
        3: begin lcd_rs = 0; data = command[2]; end // Increment cursor
        4: begin lcd_rs = 0; data = command[3]; end // Clear display
        5: begin lcd_rs = 0; data = command[4]; end // Set to second line
        6: begin lcd_rs = 1; data = 8'h31; end // Display '1'
        7: begin lcd_rs = 1; data = 8'h32; end // Display '2'
        8: begin lcd_rs = 1; data = 8'h33; end // Display '3'
        9: begin lcd_rs = 1; data = 8'h34; end // Display '4'
        10: begin lcd_rs = 1; data = 8'h35; end // Display '5'
        11: begin lcd_rs = 1; data = 8'h36; end // Display '6'
        12: begin lcd_rs = 1; data = 8'h37; end // Display '7'
        13: begin lcd_rs = 1; data = 8'h38; end // Display '8'
        14: begin lcd_rs = 1; data = 8'h39; end // Display '9'
        15: begin lcd_rs = 1; data = 8'h41; end // Display 'A'
        16: begin lcd_rs = 1; data = 8'h42; end // Display 'B'
        17: begin lcd_rs = 1; data = 8'h43; end // Display 'C'
        18: begin lcd_rs = 1; data = 8'h44; end // Display 'D'
        19: begin lcd_rs = 1; data = 8'h45; end // Display 'E'
        20: begin lcd_rs = 1; data = 8'h46; end // Display 'F'
        21: begin lcd_rs = 1; data = 8'h47; end // Display 'G'
        default: begin lcd_rs = 0; data = 8'h80; end // Return cursor to initial position
    endcase
end

endmodule

module clk_divider (in_Clk, out_Clk);
// Implement the clock divider logic here
endmodule
