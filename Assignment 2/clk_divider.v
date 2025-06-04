module clk_divider(inClk,reset,outClk);
input inClk;
input reset;
output outClk;
reg outClk;
reg[31:0] clockCount;

always @(negedge reset or posedge inClk)
begin
if (reset==1'b0)
begin
clockCount<=32'b0;
outClk<=1'b0;
end

else begin
clockCount<=clockCount+1;
if(clockCount==42000000)
begin
clockCount<=1'b0;
outClk<=~outClk;
end
end
end
endmodule
