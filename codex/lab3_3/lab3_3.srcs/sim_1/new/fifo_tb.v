`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/02 17:41:19
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb();
reg en_out,en_in,rst,clk;
reg [3:0]in ;
wire full,empty;
wire [3:0] out;
wire [3:0] i1,j1;
wire  [7:0]   an;
wire  [6:0]   seg;
wire dp;
fifo DUT (en_out,en_in,in,rst,clk,full,empty,out,i1,j1,an,seg,dp);
initial
begin
    clk=0;
    forever #0.02 clk=~clk;
end
initial
begin
    rst=0;
    #1 rst=1;
    #1 rst=0;
end
initial
begin
    in=1;
    #5 en_in=1;
    #1 en_in=0;in=2;
    #4 en_in=1;
    #1 en_in=0;in=3;
    #4 en_in=1;
    #1 en_in=0;in=4;
    #4 en_in=1;
    #1 en_in=0;in=5;
    #4 en_in=1;
    #1 en_in=0;in=6;
    #4 en_in=1;
    #1 en_in=0;in=7;
    #4 en_in=1;
    #1 en_in=0;in=8;
    #4 en_out=1;
    #1 en_out=0;
end
endmodule












