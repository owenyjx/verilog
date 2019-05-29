`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/26 19:52:07
// Design Name: 
// Module Name: main
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


module processor(clk,rst,pcinit,nowpc,ins,read,readdata,readmem,memdata,run,enable,data);
input clk,rst,enable;
input [4:0] read,data;
input [31:0] readmem;
input [31:0]pcinit;
output [31:0]nowpc,ins,readdata,memdata;
input run;
wire [31:0]pcin,pcout,ALUin,ALUout,Memaddress,Aout,Bout,MemData,MemDatao,Ai,Bi,wd,M3,Ao,Bo,ALU1,ALU2,instruction;
wire PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite,ALUSrcA,RegWrite,RegDst,zero;
wire [1:0] ALUOp,ALUSrcB,PCSource;
wire [5:0] in31;
wire [4:0] in25,in20,rd;
wire [15:0] in15;
wire [2:0] ALUControl;
wire [27:0] J;

PC PC(clk,zero,PCWriteCond,PCWrite,pcin,pcout,pcinit,rst);
controlunit controlunit(rst,clk,in31,PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite,PCSource,ALUOp,ALUSrcB,ALUSrcA,RegWrite,RegDst,run);
//DataSelector_2to1_32 DataSelector_2to1_321(pcout, ALUout, lorD, Memaddress);
iMem iMem(pcout,instruction);
dMem dMem(rst,lorD,ALUout,MemRead,MemWrite,Bo,MemData,readmem[31:0],memdata,enable,data);
InsReg InsReg(IRWrite,instruction,in31,in25,in20,in15);
MemData_DR MemData_DR(clk,MemData,MemDatao);
DataSelector_2to1_5 DataSelector_2to1_5(in20, in15[15:11], RegDst, rd);
DataSelector_2to1_32 DataSelector_2to1_322(ALUout, MemDatao, MemtoReg, wd);
RegFile RegFile(in25, in20, rd, wd, RegWrite, Ai, Bi, read[4:0], readdata, rst, clk);
A_DR A_DR(clk,Ai,Ao);
B_DR B_DR(clk,Bi,Bo);
Shiftleft_2 Shiftleft_2({16*{1'b0},in15},M3);
DataSelector_2to1_32 DataSelector_2to1_323(pcout, Ao, ALUSrcA, ALU1);
DataSelector_4to1 DataSelector_4to1(Bo, 1, {16*{1'b0},in15}, M3, ALUSrcB, ALU2);
ALUcontrol ALUcontrol(ALUOp,{in31,in25,in20,in15},ALUControl);
ALU ALU(ALU1, ALU2, ALUControl, zero, ALUin);
ALU_DR ALU_DR(clk,ALUin,ALUout);
Shiftleft_1 Shiftleft_1({in25,in20,in15},J);
DataSelector_3to1_32 DataSelector_3to1_32(pcout+1, pcout+1+in15, {pcout[31:28],J}, PCSource, pcin, zero);
assign ins=instruction;
assign nowpc=pcout;
endmodule
