`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/25 18:51:45
// Design Name: 
// Module Name: ALU
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


module ALUcontrol(ALUOp,opcode,ALUControl);
input [1:0] ALUOp;
input [31:0] opcode;
output reg [2:0] ALUControl;
wire [5:0]alucontrol;
assign alucontrol[0]=opcode[0];
assign alucontrol[1]=opcode[1];
assign alucontrol[2]=opcode[2];
assign alucontrol[3]=opcode[3];
assign alucontrol[4]=opcode[4];
assign alucontrol[5]=opcode[5];
always@(ALUOp)
begin
    case(ALUOp)
    2'b00:ALUControl=3'b000;//jia
    2'b01:ALUControl=3'b001;//beq
    2'b10:
    begin
    case(opcode[31:26])
    6'b000000:
    begin
    case(alucontrol)
    6'b100000:ALUControl=3'b000;//add
    6'b100010:ALUControl=3'b001;//sub
    6'b100100:ALUControl=3'b110;//and
    6'b101010:ALUControl=3'b011;//slt
    6'b100101:ALUControl=3'b101;//or
    6'b100110:ALUControl=3'b111;//xor
    6'b100111:ALUControl=3'b010;//nor
    endcase
    end
    6'b001000:ALUControl=3'b000;//addi
    6'b001100:ALUControl=3'b110;//andi
    6'b001101:ALUControl=3'b101;//ori
    6'b001110:ALUControl=3'b010;//xori
    6'b001010:ALUControl=3'b011;//slti
    endcase
    end
    2'b11:ALUControl=3'b100;//bne
    endcase
end
endmodule

module ALU(A, B, ALUControl, zero, result);
input [31:0] A, B;
input [2:0] ALUControl;
output zero;
output reg [31:0] result;
assign zero = (result? 0 : 1);
always @(A or B or ALUControl) begin
    case(ALUControl)
      3'b000: result = A + B;
      3'b001: result = A - B;
      3'b010: result = ~(A | B);
//      3'b010: begin
//          if (A < B &&(( A[31] == 0 && B[31]==0)  || (A[31] == 1 && B[31]==1)))  result = 1;
//          else if (A[31] == 0 && B[31]==1)  result = 0;
//          else if (A[31] == 1 && B[31]==0)  result = 1;
//          else result = 0; 
//      end
      3'b011: result = (A < B ? 1 : 0);
      3'b100: result = (A == B ? 1 : 0);
      3'b101: result = A | B;
      3'b110: result = A & B;
      3'b111: result = (~A & B) | (A & ~B);
      default: result = 0;
    endcase
  end
endmodule











