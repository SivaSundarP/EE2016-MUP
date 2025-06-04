module decoder(cntr,Seven_Seg);
input[2:0] cntr;
output[7:0] Seven_Seg;
reg[6:0] val;

assign Seven_Seg={1'b1,~val};

always@(cntr)
begin
case(cntr)
3'd0: val=7'b0111111;
3'd1: val=7'b0000110;
3'd2: val=7'b1011011;
3'd3: val=7'b1001111;
3'd4: val=7'b1100110;
3'd5: val=7'b1101101;
3'd6: val=7'b1111101;
3'd7: val=7'b0000111;
default: val = 7'b0000000;

endcase
end 
endmodule
