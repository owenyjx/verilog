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


module tb();
reg clk;
reg rst;
reg run;
reg [31:0] pcinit;
reg [31:0]  read;
wire [31:0] readdata,nowpc;
reg  [4:0]  reg_addr;
wire [31:0] reg_data;
processor DUT(clk,rst,pcinit,nowpc,reg_addr,reg_data,read,readdata,run);
initial
begin
run = 1;
clk = 0;
forever #1 clk=~clk;
end

initial
#300 run = 0;


initial
begin
rst = 1;
reg_addr = 16;

read=32'd8;
pcinit=32'ha;
#4 rst=0;
end

endmodule











