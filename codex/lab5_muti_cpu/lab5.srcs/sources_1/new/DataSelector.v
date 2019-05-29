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


module DataSelector_3to1_32(zero,PCWriteCond,A, B, C, Control, Result);
  input [31:0] A, B, C;
  input [1:0] Control;
  output reg[31:0] Result;
  input zero,PCWriteCond;
  always @(*)//Control or A or B or C or PCWriteCond) 
  begin
  if (zero & PCWriteCond) begin
  case(Control)
  2'd0: Result = A;
  2'd1: Result = B;
  2'd2: Result = C;
  default Result = Result;
  endcase
  end
  else begin
  case(Control)
  2'd0: Result = A;
  2'd1: Result = A;
  2'd2: Result = C;
  default Result = Result;
  endcase
  end
  end
endmodule

//module DataSelector_2to1_sa(A, B, Control, Result);
//  input [31:0] A;
//  input [31:0] B;
//  input Control;
//  output [31:0] Result;
//  assign Result = (Control == 1'b0 ? A : B);
//endmodule

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