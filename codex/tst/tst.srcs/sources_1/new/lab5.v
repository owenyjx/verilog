`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/23 18:34:56
// Design Name: 
// Module Name: DDU
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
module seg_ctrl(
input [3:0]x,
input [7:0]sel,
output [7:0]an,
output reg [6:0]seg
);
assign an =sel;
always @(x)
begin
case(x)
4'b0000:seg=7'b0000001;
4'b0001:seg=7'b1001111;
4'b0010:seg=7'b0010010;
4'b0011:seg=7'b0000110;
4'b0100:seg=7'b1001100;
4'b0101:seg=7'b0100100;
4'b0110:seg=7'b0100000;
4'b0111:seg=7'b0001111;
4'b1000:seg=7'b0000000;
4'b1001:seg=7'b0000100;
4'b1010:seg=7'b0000100;
4'b1011:seg=7'b0000011;
4'b1100:seg=7'b1000110;
4'b1101:seg=7'b0100001;
4'b1110:seg=7'b0000110;
4'b1111:seg=7'b0001110;
endcase
end
endmodule

module DDU(
input cont,
input step,
input mem,
input inc,
input dec,
input rst,
input clk_5m,
output [7:0]led1,
output [7:0]led2,
output  [7:0]   an,
output  [6:0]   seg,
output reg    clk_1,
output clk_1r,
output reg run,
output reg [31:0]read,
output reg     flag
 );
wire     rst_n;
reg     [31:0]  cnt1,cnt2;
reg     [7:0]   seg_sel;
reg     [3:0]   seg_din;  
wire    [3:0]   data[7:0];
wire     [31:0]  reg_data,mem_data;
reg     [7:0]   mem_addr,reg_addr,pc;
wire     [31:0] nowpc,ins,pcinit;
seg_ctrl  seg_ctrl(
     .x              (seg_din),
     .sel            (seg_sel),
     .an             (an),
     .seg            (seg)
     ); 
always@(inc or dec or rst)
begin
    if(rst)
    begin
        read = 0;
    end
    else if(inc)
        read=read+1;
    else if (dec)
        read=read-1;
end
always@(posedge clk_5m or negedge rst_n)
 begin 
    if(rst)
    begin
        cnt1 <= 32'h0;
        clk_1 <= 0;
    end
    else if(cnt1<32'd1000)
        cnt1 <= cnt1 + 1;
    else
    begin
        cnt1 <= 32'h0;
        clk_1 <= ~clk_1;
    end
end  
//cont = 1：run = 1，控制CPU连续执行指令
//cont = 0：每按动step一次，run输出维持一个时钟周期的脉冲，控制CPU执行一周期指令
//always@(posedge clk_1) 
//begin    
//    if(step&&~cont)
//        flag=1;
//    if(rst)
//        flag=0;
//    if(cont)
//    begin
//        run<=1;
//    end
//    else if(flag==1)
//    begin
//        run<=1;
//        flag=0;
//    end
//    else if(flag==0)
//        run=0;
//end
always@(step or cont)
begin
    if(step&&~cont)
        flag=1;
    else if (~step&&~cont)
        flag=0;
    else 
        flag=1;
end
always@(posedge clk_1)
begin
    if(flag)
        run=1;
    else
        run=0;
end
assign clk_1r= (run)? clk_1:0;
assign pcinit=32'b00000000000000000000000000000000;
assign led1=read;


//processor processor (clk_1r,clk_50m,rst,pcinit,nowpc,ins,read,reg_data,mem_data);
//assign led[7:0]=nowpc[7:0];
//mem： 1，查看MEM；0，查看RF
//inc/dec：增加或减小待查看RF/MEM的地址addr
//reg_data/mem_data：从RF/MEM读取的数据
//8位数码管显示RF/MEM的一个32位数据
//16位LED指示RF/MEM的地址和PC的值
assign data[7]= (mem)? mem_data[3:0] : reg_data[3:0];
assign data[6]= (mem)? mem_data[7:4] : reg_data[7:4];
assign data[5]= (mem)? mem_data[11:8] : reg_data[11:8];
assign data[4]= (mem)? mem_data[15:12] : reg_data[15:12];
assign data[3]= (mem)? mem_data[19:16] : reg_data[19:16];
assign data[2]= (mem)? mem_data[23:20] : reg_data[23:20];
assign data[1]= (mem)? mem_data[27:24] : reg_data[27:24];
assign data[0]= (mem)? mem_data[31:28] : reg_data[31:28];
assign led= (mem)? {mem_addr,pc}:{reg_addr,pc};
    always@(posedge clk_5m or negedge rst_n)
    begin
        if(~rst_n)
        begin
            seg_sel <= 8'b0;
            seg_din <= 0;
        end
        else case(cnt1[15:13])
            3'b000:
            begin
                seg_sel <= 8'b0111_1111;    
                seg_din <= data[0];
            end
            3'b001:
            begin
                seg_sel <= 8'b1011_1111;
                seg_din <= data[1];
            end
            3'b010:
            begin
                seg_sel <= 8'b1101_1111;
                seg_din <= data[2];
            end
            3'b011:
            begin
                seg_sel <= 8'b1110_1111; 
                seg_din <= data[3];            
            end        
            3'b100:
            begin
                seg_sel <= 8'b1111_0111;                   
                seg_din <= data[4];
            end        
            3'b101:
            begin
                seg_sel <= 8'b1111_1011;
                seg_din <= data[5];
            end        
            3'b110:
            begin
                seg_sel <= 8'b1111_1101;
                seg_din <= data[6];
            end        
            3'b111:  
            begin
                seg_sel <= 8'b1111_1110;
                seg_din <= data[7];
            end        
            endcase      
    end
endmodule












