`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/25 20:41:27
// Design Name: 
// Module Name: Mem
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


module iMem(i_address,o_MemData);
input [31:0]  i_address;
output [31:0] o_MemData;

dist_mem_gen_0 dist_mem_gen_0(
.a          (i_address[7:0]),
.spo        (o_MemData)
);
endmodule

module dMem(rst,i_address,i_MemRead,i_MemWrite,i_Writedata,o_MemData,i_mem_addr,o_mem_data);
input rst;
input i_MemRead,i_MemWrite;
input [31:0] i_address,i_mem_addr;
input [31:0]  i_Writedata;
output [31:0] o_MemData,o_mem_data;
wire [31:0]  MemData2;
reg   [31:0] MemData1;
reg [31:0]   dmem[255:0];
integer i; 
always@(*)
if (rst)
  begin
   for(i = 0;i < 256;i = i + 1)
    dmem[i] = 0;      
    dmem[12] = 32'h8;
    dmem[16] = 32'h1;
    dmem[20] = 32'h6;
    dmem[24] = 32'hfffffff8;
    dmem[28] = 32'h1;
    dmem[32] = 32'h3;
    dmem[36] = 32'h5;
  end
 else if(i_MemWrite)
      dmem[ i_address[7:0] ] = i_Writedata;
      
always@(*)
begin
    if(i_MemRead)
        MemData1 = dmem[ i_address[7:0] ];
end
assign o_MemData = MemData1;
assign o_mem_data= dmem[i_mem_addr];
endmodule









