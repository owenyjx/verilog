`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/25 20:16:09
// Design Name: 
// Module Name: DataSelector
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


module DataSelector_3to1_32(A, B, C, Control, Result, zero);
  input [31:0] A, B, C;
  input zero;
  input [1:0] Control;
  output reg[31:0] Result;
  always @(Control or A or B or C or zero) 
  begin
    case({Control,zero})
        3'b001:Result = A;
        3'b011:Result = B;
        3'b101:Result = C;
        3'b000:Result = A;
        3'b010:Result = A;
        3'b100:Result = C;
     endcase
  end
endmodule

module DataSelector_4to1(A, B, C, D, Control, Result);
  input [31:0] A, B, C, D;
  input [1:0]Control;
  output reg[31:0] Result;
  always @(Control or A or B or C or D) begin
    case(Control)
        2'b00: Result = A;
        2'b01: Result = B;
        2'b10: Result = C;
        2'b11: Result = D;
        default: Result = 0;
     endcase
  end
endmodule

module DataSelector_2to1_32(A, B, Control, Result);
  input [31:0] A, B;
  input Control;
  output [31:0] Result;
  assign Result = (Control == 1'b0 ? A : B);
endmodule

module DataSelector_2to1_5(A, B, Control, Result);
  input [4:0] A, B;
  input Control;
  output [4:0] Result;
  assign Result = (Control == 1'b0 ? A : B);
endmodule