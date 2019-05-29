`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/19 20:41:46
// Design Name: 
// Module Name: lab1_3
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


module fibs(a,b,y,clk,rst);
input [2:0]a;
input [2:0]b;
output reg [7:0] y;
input clk;
reg [7:0]t;
reg [7:0]a1;
reg [7:0]b1;
input rst;
always @(posedge clk)
begin
if(rst==1)
    begin
        a1=a;
        b1=b;
        y=a1+b1;
    end
    begin
        t=a1+b1;
        a1=b1;
        b1=t;
        y=t;
    end
end

endmodule











