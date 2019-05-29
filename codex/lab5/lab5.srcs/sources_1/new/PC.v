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


module PC(clk,zero,PCWriteCont,PCWrite,ipc,opc,pcinit,rst);
input clk,zero,PCWriteCont,PCWrite,rst;
input [31:0] ipc,pcinit;
output reg [31:0] opc;
wire enpc;
reg [31:0] ippc;
assign enpc=(PCWrite) ;//| (PCWriteCont & zero)
always@(posedge enpc or posedge rst )
begin
    if(rst)
        opc=pcinit;
    else if(enpc)
        opc=ipc;
    else if(!enpc)
        opc=opc;
end
endmodule

