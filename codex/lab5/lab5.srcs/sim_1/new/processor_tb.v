`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/04 20:10:52
// Design Name: 
// Module Name: processor_tb
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


module processor_tb();
reg clk;
reg clk_50m;
reg rst;
reg [31:0] pcinit;
reg [7:0]  read;
wire [31:0] readdata,memdata,nowpc,ins;
processor DUT(clk,clk_50m,rst,pcinit,nowpc,ins,read,readdata,memdata);
initial
begin
clk=0;
forever #1 clk=~clk;
end

initial
begin
clk_50m=0;
forever #0.001 clk_50m=~clk_50m;
end

initial
begin
pcinit=32'b00100000000010000000000000000001;
end

endmodule











