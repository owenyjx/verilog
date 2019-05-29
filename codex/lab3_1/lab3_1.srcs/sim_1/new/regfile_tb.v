`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/01 09:18:35
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb();
reg [2:0] ra0,ra1,wa;
reg clk,rst,we;
reg [2:0]wd;
wire [2:0] rd0,rd1;
regfile DUT (ra0,rd0,ra1,rd1,wa,wd,we,clk,rst);
initial
begin
    clk=0;
    rst=1;
    forever #0.02 clk=~clk;
end
initial
begin
    #1 rst=0;  
end
initial
begin
    we=1; wa=1;wd=2;
    #5 wa=2;wd=1;
    #10 ra0=1; 
    #5 ra1=2;
end
endmodule











