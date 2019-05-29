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


module RegFile (clk,rst,i_read_1,i_read_2, i_write, i_data, i_RegWrite, o_data_1, o_data_2, i_reg_addr, o_reg_data);
  input clk,rst;
  input [4:0] i_read_1, i_read_2, i_write, i_reg_addr;
  input [31:0] i_data;
  input i_RegWrite;
  output [31:0] o_data_1, o_data_2;
  output [31:0]     o_reg_data;
  reg [31:0] register [0:31];
  integer i; 
 
  
 
 assign  o_data_1 = register[i_read_1];
 assign  o_data_2 = register[i_read_2];
 assign o_reg_data = register[i_reg_addr];
  always @(posedge clk) 
  if (rst) begin
   for ( i = 0 ; i < 32 ;i= i + 1)
    register[i] = 0;
  end
  else  begin
    if ((i_write != 0) && (i_RegWrite == 1)) begin
      register[i_write] = i_data;
    end
  end
endmodule

module InsReg (i_ins,o_in1,o_in2,o_in3,o_in4);
input  [31:0] i_ins;
output [5:0]  o_in1;
output [4:0]  o_in2,o_in3;
output [15:0] o_in4;
reg [31:0]instruction;
always@(i_ins)
instruction = i_ins;
 
assign o_in1 = instruction[31:26];
assign o_in2 = instruction[25:21];
assign o_in3 = instruction[20:16];
assign o_in4 = instruction[15:0];
endmodule










