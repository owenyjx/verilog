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


module processor(clk,rst,i_pcinit,o_pc,i_reg_addr,o_reg_data,i_mem_addr,o_mem_data,i_run);
input clk,rst;
input [4:0]   i_reg_addr;
input [31:0]  i_mem_addr;
input [31:0]  i_pcinit;
output [31:0] o_pc,o_reg_data,o_mem_data;
input i_run;
wire  [31:0] pcin,pcout,ALUin,ALUout,Memaddress;
wire  [31:0] Aout,Bout,MemData,MemDatao;
wire  [31:0] Ai,Bi,wd,Mux_3,Ao,Bo,ALU1,ALU2,instruction;
wire  PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite,ALUSrcA,RegWrite,RegDst,zero;
wire [1:0] ALUOp,ALUSrcB,PCSource;
wire [5:0] ins_31to26;
wire [4:0] ins_25to21,ins_20to16,rd;
wire [15:0]ins_15to0;
wire [2:0] ALUControl;
wire [27:0] J;


PC PC(zero,PCWriteCond,PCWrite,pcin,pcout,i_pcinit,rst);

controlunit controlunit(rst,clk,i_run,ins_31to26,PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite,PCSource,ALUOp,ALUSrcB,ALUSrcA,RegWrite,RegDst);
//DataSelector_2to1_32 DataSelector_2to1_321(pcout, ALUout, lorD, Memaddress);
iMem iMem(pcout,instruction);
dMem dMem(rst,ALUout,MemRead,MemWrite,Bo,MemData,i_mem_addr,o_mem_data);
InsReg InsReg(instruction,ins_31to26,ins_25to21,ins_20to16,ins_15to0);
MemData_DR MemData_DR(clk,MemData,MemDatao);
DataSelector_2to1_5 DataSelector_2to1_5(ins_20to16, ins_15to0[15:11], RegDst, rd);
DataSelector_2to1_32 DataSelector_2to1_32(ALUout, MemDatao, MemtoReg, wd);
RegFile RegFile(clk,rst,ins_25to21, ins_20to16, rd, wd, RegWrite, Ai, Bi, i_reg_addr, o_reg_data);
A_DR A_DR(clk,Ai,Ao);
B_DR B_DR(clk,Bi,Bo);
Shiftleft_2 Shiftleft_2({16'b0,ins_15to0},Mux_3);
DataSelector_2to1_32 DataSelector_2to1_323(pcout, Ao, ALUSrcA, ALU1);
DataSelector_4to1 DataSelector_4to1(Bo, 1, {16'b0,ins_15to0}, Mux_3, ALUSrcB, ALU2);
ALUcontrol ALUcontrol(ALUOp,instruction,ALUControl);
ALU ALU(ALU1, ALU2, ALUControl, zero, ALUin);
ALU_DR ALU_DR(clk,ALUin,ALUout);
Shiftleft_1 Shiftleft_1({ins_25to21,ins_20to16,ins_15to0},J);
DataSelector_3to1_32 DataSelector_3to1_32(zero,PCWriteCond,pcout + 1, pcout + 1 + ins_15to0 , { pcout[31:28] , J }, PCSource, pcin);
//DataSelector_3to1_32 DataSelector_3to1_32(ALUin, ALUout , { pcout[31:28] , J }, PCSource, pcin);
assign o_pc=pcout;

endmodule
