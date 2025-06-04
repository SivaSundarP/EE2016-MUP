module dflipflop_withreset(q, qbar, d, rst, clk);
    output reg q, qbar;
    input d, rst, clk;

    always @(posedge clk or negedge rst)
    begin
        if (~rst) 
        begin
            q <= 1'b0;      
            qbar <= 1'b1;   
        end
        else
        begin
            q <= d;        
            qbar <= ~d;     
        end
    end
endmodule

