`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/13 09:46:42
// Design Name: 
// Module Name: lab4
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


module PCU(rst,clk,rgb,dir,draw,vr,vg,vb,hs,vs);
input rst;
input clk;
input [11:0] rgb;
input [3:0] dir;
input draw;
output [3:0]vr,vg,vb;
output hs,vs;
reg [5:0] t;
reg [15:0] paddr;
reg [11:0] pdata;
wire [11:0]dpo;
wire [15:0] x,y;
wire we;
wire clk_50m;
wire rst_n;
wire [15:0]dpra;
wire en;
reg flag;
reg clk_1p;
reg [31:0]cnt;
wire [10:0] px,py;
reg state;
reg flag;
clk_wiz_0   clk_wiz_0(
.clk_in1    (clk),
.clk_out1   (clk_50m),
.reset      (rst),
.locked     (rst_n)
);
dist_mem_gen_1 dist_mem_gen_1(
.a          (paddr),
.d          (rgb),
.dpra       (dpra),
.clk        (clk_50m),
.we         (draw),
.dpo        (dpo)
);
VGA dcu (clk_50m,rst,hs,vs,x,y);
assign dpra=256*y+x;
assign {vr,vg,vb}= ((dpra<=paddr+3)&&(dpra>=paddr-3)||(dpra==paddr+256*3)||(dpra==paddr+256*2)||(dpra==paddr+256*1)||(dpra==paddr-256*3)||(dpra==paddr-256*2)||(dpra==paddr-256*1))? 12'b111111111111:dpo;
always @ (posedge clk_50m or posedge rst)
begin
    if(rst)
    begin
        cnt=0;
        clk_1p=0;
    end
    else if(cnt==500000)
    begin
        clk_1p=~clk_1p;
        cnt=0;
    end
    else 
    begin
        cnt=cnt+1;
    end
end
always @ (posedge clk_1p)
begin
    if(dir==4'b0000)
        begin
        t<=0;
        end
    else if(t<10)
        t<=t+1;
end
always @ (t)
begin
    if(t==10)
        state=1;
    else
    begin
        state=0;
    end
end
always @ (posedge clk_1p or posedge rst)
begin
    if(rst)
        begin
            paddr<=256*128+128;
            flag=1;    
        end
    else if(dir==4'b0000)
        flag=1;
    else if(state)
        begin
        case(dir)
        4'b0001:paddr<=paddr-1;
        4'b0010:paddr<=paddr-256;
        4'b0100:paddr<=paddr+1;
        4'b1000:paddr<=paddr+256;
        4'b0011:paddr<=paddr-257;
        4'b0110:paddr<=paddr-255;
        4'b1100:paddr<=paddr+257;
        4'b1001:paddr<=paddr+255;
        endcase
        end
    else if(flag&&!state)
        begin
        case(dir)
        4'b0001:paddr<=paddr-1;
        4'b0010:paddr<=paddr-256;
        4'b0100:paddr<=paddr+1;
        4'b1000:paddr<=paddr+256;
        4'b0011:paddr<=paddr-257;
        4'b0110:paddr<=paddr-255;
        4'b1100:paddr<=paddr+257;
        4'b1001:paddr<=paddr+255;
        endcase
        flag=0;    
        end

end
endmodule

module VGA (
    input clk, rst,
    output hs, vs,
    output [15:0] x, y

);
    wire en;
    parameter HD = 800, HF = 56, HS = 120, HB = 64;
    parameter VD = 600, VF = 37, VS = 6, VB = 23;
    reg [15:0] hc, vc;
    assign x = en ? hc : 0;
    assign y = en ? vc : 0;
    assign en = (hc < 712) && (vc < 457) && (hc > 456) && (vc > 201);
    assign hs = (hc >= HS) ;
    assign vs = (vc >= VS );
    
//    assign en = (hc < HD) && (vc < VD);
//    assign hs = ~((hc >= HD + HF) && (hc < HD + HF + HS));
//    assign vs = ~((vc >= VD + VF) && (vc < VD + VF + VS));
always @ (posedge clk or posedge rst)
    if(rst) hc <= 15'd0;
    else if(hc == 15'd1039) hc <= 15'd0;
    else hc <= hc+1'b1;

always @ (posedge clk or posedge rst)
    if(rst) vc <= 15'd0;
    else if(vc == 15'd665) vc <= 15'd0;
    else if(hc == 15'd1039) vc <= vc+1'b1;

endmodule
//module VRAM(paddr,pdata,we,vaddr,vdata);
//input [15:0]paddr;
//input [11:0]pdata;
//input we;
//output [15:0]vaddr;
//output [11:0]vdata;

//endmodule
//module vga(rst_n,clk,vr,vg,vb,hsync_r,vsync_r);
//input rst_n;
//input clk;
//output [3:0]vr,vg,vb;
//reg [7:0]x,y;
//wire [11:0]vrgb;
//wire [15:0]a;
//reg[10:0] x_cnt;    //行坐标
//reg[9:0] y_cnt;    //列坐标
//always @ (posedge clk or negedge rst_n)
//    if(!rst_n) x_cnt <= 11'd0;
//    else if(x_cnt == 11'd1039) x_cnt <= 11'd0;
//    else x_cnt <= x_cnt+1'b1;

//always @ (posedge clk or negedge rst_n)
//    if(!rst_n) y_cnt <= 10'd0;
//    else if(y_cnt == 10'd665) y_cnt <= 10'd0;
//    else if(x_cnt == 11'd1039) y_cnt <= y_cnt+1'b1;
    
//wire valid;    //有效显示区标志
    
//assign valid = (x_cnt >= 11'd187) && (x_cnt < 11'd987) 
//                        && (y_cnt >= 10'd31) && (y_cnt < 10'd631); 
    
//wire[9:0] xpos,ypos;    //有效显示区坐标
    
//assign xpos = x_cnt-11'd187;
//assign ypos = y_cnt-10'd31;
//assign a=xpos*256+ypos;   
//output reg hsync_r,vsync_r;    //同步信号产生

//always @ (posedge clk or negedge rst_n)
//    if(!rst_n) hsync_r <= 1'b1;
//    else if(x_cnt == 11'd0) hsync_r <= 1'b0;    //产生hsync信号
//    else if(x_cnt == 11'd120) hsync_r <= 1'b1;
     
//always @ (posedge clk or negedge rst_n)
//    if(!rst_n) vsync_r <= 1'b1;
//    else if(y_cnt == 10'd0) vsync_r <= 1'b0;    //产生vsync信号
//    else if(y_cnt == 10'd6) vsync_r <= 1'b1;
    
//assign hsync = hsync_r;
//assign vsync = vsync_r;
//dist_mem_gen_1 dist_mem_gen_1(
//.a(0),
//.d(0),
//.dpra(a),
//.clk(clk),
//.we(0),
//.dpo(vrgb)
//);
//assign {vr,vg,vb}=vrgb;
//endmodule
//module vga(
//            rst_n,clk,
//                vga_r,vga_g,vga_b,
//            hsync,vsync
        
//        );

//input clk;        //50MHz
//input rst_n;    //低电平复位
//output hsync;    //行同步信号
//output vsync;    //场同步信号
//output vga_r;
//output vga_g;
//output vga_b;

////--------------------------------------------------
//reg[10:0] x_cnt;    //行坐标
//reg[9:0] y_cnt;    //列坐标

//always @ (posedge clk or negedge rst_n)
//    if(!rst_n) x_cnt <= 11'd0;
//    else if(x_cnt == 11'd1039) x_cnt <= 11'd0;
//    else x_cnt <= x_cnt+1'b1;

//always @ (posedge clk or negedge rst_n)
//    if(!rst_n) y_cnt <= 10'd0;
//    else if(y_cnt == 10'd665) y_cnt <= 10'd0;
//    else if(x_cnt == 11'd1039) y_cnt <= y_cnt+1'b1;

////--------------------------------------------------
//wire valid;    //有效显示区标志

//assign valid = (x_cnt >= 11'd187) && (x_cnt < 11'd987) 
//                    && (y_cnt >= 10'd31) && (y_cnt < 10'd631); 

//wire[9:0] xpos,ypos;    //有效显示区坐标

//assign xpos = x_cnt-11'd187;
//assign ypos = y_cnt-10'd31;

////--------------------------------------------------
//reg hsync_r,vsync_r;    //同步信号产生

//always @ (posedge clk or negedge rst_n)
//    if(!rst_n) hsync_r <= 1'b1;
//    else if(x_cnt == 11'd0) hsync_r <= 1'b0;    //产生hsync信号
//    else if(x_cnt == 11'd120) hsync_r <= 1'b1;
 
//always @ (posedge clk or negedge rst_n)
//    if(!rst_n) vsync_r <= 1'b1;
//    else if(y_cnt == 10'd0) vsync_r <= 1'b0;    //产生vsync信号
//    else if(y_cnt == 10'd6) vsync_r <= 1'b1;

//assign hsync = hsync_r;
//assign vsync = vsync_r;

////--------------------------------------------------
//    //显示一个矩形框
//wire a_dis,b_dis,c_dis,d_dis;    //矩形框显示区域定位

//assign a_dis = ( (xpos>=200) && (xpos<=220) ) 
//                &&    ( (ypos>=140) && (ypos<=460) );
                
//assign b_dis = ( (xpos>=580) && (xpos<=600) )
//                && ( (ypos>=140) && (ypos<=460) );

//assign c_dis = ( (xpos>=220) && (xpos<=580) ) 
//                &&    ( (ypos>140)  && (ypos<=160) );
                
//assign d_dis = ( (xpos>=220) && (xpos<=580) )
//                && ( (ypos>=440) && (ypos<=460) );

//    //显示一个小矩形
//wire e_rdy;    //矩形的显示有效矩形区域

//assign e_rdy = ( (xpos>=385) && (xpos<=415) )
//                &&    ( (ypos>=285) && (ypos<=315) );

////-------------------------------------------------- 
//    //r,g,b控制液晶屏颜色显示，背景显示蓝色，矩形框显示红蓝色
//assign vga_r = valid ? e_rdy : 1'b0;
//assign vga_g = valid ?  (a_dis | b_dis | c_dis | d_dis) : 1'b0;
//assign vga_b = valid ? ~(a_dis | b_dis | c_dis | d_dis) : 1'b0;      

//endmodule



