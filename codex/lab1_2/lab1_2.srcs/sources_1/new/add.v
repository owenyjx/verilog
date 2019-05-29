`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 19:41:56
// Design Name: 
// Module Name: add
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


module acm(a,clk,rst,s);
input [5:0]a;
output reg [5:0]s;
input rst;
input clk;
reg [5:0]t;
always@(posedge clk)
    begin
        if(rst)
            s=0;
        else
        begin
            t=s;
            s=t+a;
        end
    end 
endmodule




























