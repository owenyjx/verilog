`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/26 16:25:59
// Design Name: 
// Module Name: Shift
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


module Shiftleft_1(Ai,Ao);
input [25:0]Ai;
output [27:0]Ao;
assign Ao=Ai;
endmodule

module Shiftleft_2(Ai,Ao);
input [31:0]Ai;
output [31:0]Ao;
assign Ao=Ai<<2;
endmodule


