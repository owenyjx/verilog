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
reg clk_50m;
reg rst;
reg [31:0] pcinit;
reg [31:0]  read,readmem;
wire [31:0] memdata, nowpc, ins, readdata;
reg run;
processor DUT(clk,rst,pcinit,nowpc,ins,read,readdata,readmem,memdata,run);
initial
begin
clk=0;
forever #1 clk=~clk;
end


initial
begin
read=17;readmem=8;
pcinit=32'b000000000000000000000000;
end

initial
begin
rst=0;
#1
rst=1;
#4
rst=0;
end

initial
begin
run=0;
#5
run=1;
#5
run=0;
#5
run=1;
#5
run=0;
#5
run=1;
#5
run=0;
#5
run=1;
end

endmodule












