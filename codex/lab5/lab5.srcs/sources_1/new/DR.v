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
    Ao=Ai;
endmodule

module B_DR(clk,Bi,Bo);
input clk;
input [31:0]Bi;
output reg [31:0]Bo;
always@(posedge clk)
    Bo=Bi;
endmodule

module ALU_DR(clk,ALUi,ALUo);
input clk;
input [31:0]ALUi;
output reg [31:0]ALUo;
always@(posedge clk)
    ALUo=ALUi;
endmodule

module MemData_DR(clk,MemDatai,MemDatao);
input clk;
input [31:0]MemDatai;
output reg [31:0]MemDatao;
always@(posedge clk)
    MemDatao=MemDatai;
endmodule