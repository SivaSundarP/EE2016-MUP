module johnson3bit(Seven_Seg,in_clk,rst,digit);
input in_clk,rst;
output[7:0]Seven_Seg;
output[3:0]digit;
wire[2:0]cntr;                                        

wire q0;
wire q1;
wire q2;
wire q2bar;
wire q1bar;
wire q0bar;
wire outClk;

assign digit=4'b0001;
assign cntr={q2,q1,q0};

clk_divider cd0(in_clk,rst,outClk);
dflipflop_withreset dff2(q2,q2bar,q0bar,rst,outClk);
dflipflop_withreset dff1(q1,q1bar,q2,rst,outClk);
dflipflop_withreset dff0(q0,q0bar,q1,rst,outClk);

decoder dec0(cntr,Seven_Seg);
endmodule
