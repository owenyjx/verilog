`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/26 16:31:37
// Design Name: 
// Module Name: PC
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


module PC(i_zero,i_PCWriteCond,i_PCWrite,i_pc,o_pc,i_pcinit,rst);
input  rst,i_zero,i_PCWriteCond,i_PCWrite;
input [31:0] i_pc,i_pcinit;
output reg [31:0] o_pc;
wire pc_enable;

assign pc_enable = ( i_PCWrite) ;//| ( i_PCWriteCond & i_zero);
always@( posedge pc_enable, posedge rst)
    if(rst)
        o_pc = i_pcinit;
    else if(pc_enable)
         o_pc = i_pc;
         else 
         o_pc = o_pc;
endmodule

