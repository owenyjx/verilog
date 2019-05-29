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


module ALUcontrol(i_ALUOp,i_opcode,o_ALUControl);
input [1:0] i_ALUOp;
input [31:0] i_opcode;
output reg [2:0] o_ALUControl;
wire [5:0]alu_control;
assign alu_control = i_opcode[5:0];
always@(i_ALUOp,alu_control,i_opcode)
begin
    case(i_ALUOp)
    2'b00: o_ALUControl=3'b000;//add
    2'b01: o_ALUControl=3'b001;//beq
    2'b10: begin
           case(i_opcode[31:26])
           6'b000000:begin
                    case(alu_control)
                    6'b100000: o_ALUControl = 3'b000;//add
                    6'b100010: o_ALUControl = 3'b001;//sub
                    6'b100100: o_ALUControl = 3'b110;//and
                    6'b101010: o_ALUControl = 3'b011;//slt
                    6'b100101: o_ALUControl = 3'b101;//or
                    6'b100110: o_ALUControl = 3'b111;//xor
                    6'b100111: o_ALUControl = 3'b010;//nor
                    endcase
                    end
           6'b001000: o_ALUControl = 3'b000;//addi
           6'b001100: o_ALUControl = 3'b110;//andi
           6'b001101: o_ALUControl = 3'b101;//ori
           6'b001110: o_ALUControl = 3'b010;//xori
           6'b001010: o_ALUControl = 3'b011;//slti
           endcase
           end
    2'b11: o_ALUControl = 3'b100;//bne
    endcase
end
endmodule

module ALU(A, B, i_ALUControl,o_zero,o_result);
input [31:0] A, B;
input [2:0] i_ALUControl;
output o_zero;
output reg [31:0] o_result;
assign o_zero = ( o_result ? 0 : 1);
always @(*) begin
    case(i_ALUControl)
      3'b000: o_result = A + B;
      3'b001: o_result = A - B;
      3'b010: o_result = ~(A | B);
//      3'b010: begin
//          if (A < B &&(( A[31] == 0 && B[31]==0)  || (A[31] == 1 && B[31]==1)))  result = 1;
//          else if (A[31] == 0 && B[31]==1)  result = 0;
//          else if (A[31] == 1 && B[31]==0)  result = 1;
//          else result = 0; 
//      end
      3'b011: o_result = (A < B ? 1 : 0);
      3'b100: o_result = (A == B ? 1 : 0);
      3'b101: o_result = A | B;
      3'b110: o_result = A & B;
      3'b111: o_result = A ^ B;
    endcase
  end
endmodule











