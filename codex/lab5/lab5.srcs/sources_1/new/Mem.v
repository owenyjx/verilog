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


module iMem(address,MemData);
input [31:0]address;
output [31:0]MemData;

dist_mem_gen_0 dist_mem_gen_0(
.a          (address[7:0]),
.spo        (MemData)
);

endmodule
//module dMem(rst,lord,i_address,i_MemRead,i_MemWrite,i_Writedata,o_MemData,i_mem_addr,o_mem_data);
module dMem(rst,lord,address,MemRead,MemWrite,Writedata,MemData,mem_addr,mem_data);
input lord;
input rst;
input MemRead,MemWrite;
input [31:0] address,mem_addr;
input [31:0]  Writedata;
output [31:0] MemData,mem_data;
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
 else if(MemWrite)
      dmem[ address[7:0] ] = Writedata;
      
always@(*)
begin
    if(MemRead)
        MemData1 = dmem[ address[7:0] ];
end
assign MemData = MemData1;
assign mem_data= dmem[mem_addr];
endmodule









