`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/25 20:50:32
// Design Name: 
// Module Name: SignExtend
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


module SignExtend(i_num,o_num);
  input [15:0] i_num;
  output reg[31:0] o_num;
  initial begin
    o_num = 0;
  end
  always @(i_num) 
  begin
  o_num <= {{16{1'b0}}, i_num[15:0]}; 
  end
endmodule
