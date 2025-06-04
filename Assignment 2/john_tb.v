module johnson3bit_tb;
    reg in_clk;
    reg rst;
    wire [7:0] Seven_Seg;
    wire [3:0] digit;
    
    johnson3bit uut (
        .Seven_Seg(Seven_Seg),
        .in_clk(in_clk),
        .rst(rst),
        .digit(digit)
    );

    always begin
        #5 in_clk = ~in_clk; 
    end

    
    initial begin
        
        in_clk = 0;
        rst = 00;

 
        #10 rst = 0;
        #10 rst = 1;

        #100000000000; 

       
        $stop;
    end

    initial begin
        $monitor("At time=%t, Seven_Seg=%b, digit=%b", $time, Seven_Seg, digit);
    end
endmodule

