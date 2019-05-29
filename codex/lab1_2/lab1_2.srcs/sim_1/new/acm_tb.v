`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 19:45:35
// Design Name: 
// Module Name: acm_tb
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


module acm_tb( );
reg [5:0]a;
wire [5:0]s;
reg rst;
reg clk;
acm DUT (.a(a),.s(s),.rst(rst),.clk(clk));
initial
    begin
    clk=0;
    forever
        #10 clk=~clk;
    end
initial
    begin
        rst=1;
        a=0;
        #15 a=0;rst=0;
        #10 a=4;
        #10 a=13;
        #10 a=12;
        #10 a=8;
    end
endmodule










