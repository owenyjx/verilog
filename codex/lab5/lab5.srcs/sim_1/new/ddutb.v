`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 19:27:58
// Design Name: 
// Module Name: tb
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


module ddutb();
reg cont;
reg step;
reg mem;
reg inc;
reg dec;
reg rst;
reg clk_50m;
wire [7:0]led1;
wire [7:0]led2;
wire  [7:0]   an;
wire  [6:0]   seg;
wire clk_1;
wire clk_1r;
wire run;
wire [31:0]read;
wire     flag;
DDU DUT(cont,step,mem,inc,dec,rst,clk_50m,led1,led2,an,seg,clk_1,clk_1r,run,read,flag);

initial
begin
clk_50m=0;
mem=1;
forever #0.001 clk_50m=~clk_50m;
end

initial 
begin
    rst=1;
    #5 rst=0;
end

initial 
begin
    cont=1;
    inc=1;
    #10 cont=1;
end

initial 
begin
    #6 step=1;
    #5 step=0;
    #20 step=1;
        #3 step=0;
end














endmodule
