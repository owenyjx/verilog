`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/24 10:12:42
// Design Name: 
// Module Name: divide_tb
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


module divide_tb();
reg [3:0]x,y;
wire [3:0]q,r;
reg clk,rst;
wire done,error;
divide DUT (x,y,q,r,clk,rst,done,error);
initial
begin
    clk=0;
    x=9;
    y=2;
        forever #10 clk=~clk;
end
initial
begin
    rst=1;
    #15 rst=0;
end
endmodule
