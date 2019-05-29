`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/26 16:07:58
// Design Name: 
// Module Name: DR
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

//Êý¾Ý·Ö¸î
module A_DR(clk,Ai,Ao);
input clk;
input [31:0]Ai;
output reg [31:0]Ao;
always@(posedge clk)
    Ao <= Ai;
endmodule

module B_DR(clk,Bi,Bo);
input clk;
input [31:0]Bi;
output reg [31:0]Bo;
always@(posedge clk)
    Bo <= Bi;
endmodule

module ALU_DR(clk,i_ALU,o_ALU);
input clk;
input [31:0] i_ALU;
output reg [31:0] o_ALU;
always@(posedge clk)
    o_ALU <= i_ALU;
endmodule

module MemData_DR(clk,i_MemData,o_MemData);
input clk;
input [31:0] i_MemData;
output reg [31:0] o_MemData;
always@(posedge clk)
   o_MemData <= i_MemData;
endmodule