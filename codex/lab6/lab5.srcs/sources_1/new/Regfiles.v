`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/23 19:10:30
// Design Name: 
// Module Name: Regfiles
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


module RegFile (rs, rt, rd, i_data, RegWrite, o_data_1, o_data_2, read, readdata, rst, clk);
   input clk;
  input [4:0] rs, rt, rd, read;
  input rst;
  input [31:0] i_data;
  input RegWrite;
  output [31:0] o_data_1, o_data_2,readdata;
  reg [31:0] register [0:31];
  integer i; 
//  always@(rst)
//   begin
//   begin
//     // 只需要确定零号寄存器的值就好，$0恒等于0
//     for(i=0;i<32;i = i + 1)
//      register[i] = 0;
//      end
//    end
  assign o_data_1 = register[rs];
  assign o_data_2 = register[rt];
  assign readdata = register[read];
  always @(posedge clk or posedge rst) begin
    if(rst)
       begin
      // 只需要确定零号寄存器的值就好，$0恒等于0
      for(i=0;i<32;i = i + 1)
       register[i] = 0;
       register[1] = 1;
       end
    else if ((rd != 0) && (RegWrite == 1)) begin
      register[rd] = i_data;
    end
    
  end
  
endmodule

module InsReg (IRWrite,ins,in1,in2,in3,in4);
input IRWrite;
input [31:0]ins;
output [5:0] in1;
output [4:0] in2,in3;
output [15:0]in4;
reg [31:0]instruction;
always@(ins)
if(1)
instruction=ins;
assign in1=instruction[31:26];
assign in2=instruction[25:21];
assign in3=instruction[20:16];
assign in4=instruction[15:0];
endmodule










