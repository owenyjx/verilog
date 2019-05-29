`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 21:57:59
// Design Name: 
// Module Name: pcu
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


module pcu(
    input [3:0]dir,
    input [11:0]rgb,
    input draw,
    input clk,
    output [3:0]r,g,b,
    output hs,vs
    );
    reg [15:0]paddr;
    reg [11:0]pdata;
    wire [15:0]x,y;
    wire [11:0]dpo;
    wire clk_50m;
    wire rst_n;
    wire we;
    wire en;
    reg clk_1p;  //时钟降速
    reg [32:0]cnt;
    wire [15:0]dpra;
    assign dpra=256*x+y;
    
    always @ (posedge clk_50m or posedge rst)  //时钟降速
    begin
        if(rst)
        begin
            cnt<=0;
            clk_1p<=0;
        end
        else if(cnt==5000000)
        begin
            clk_1p<=~clk_1p;
            cnt=0;
        end
        else 
        begin
            cnt<=cnt+1;
        end
    end

    clk_wiz_0 lll
    (   
        .clk_in1 (clk),
        .clk_out1(clk_50m),
        .reset(rst),
        .locked(rst_n)
    );
    
    dist_mem_gen_0 sdf
        (
            .a (paddr),
            .d (rgb),
            .dpra(dpra),
            .clk(clk_50m),
            .we(draw),
            .dpo(dpo)
        );
        
    assign px=paddr%256;
    assign py=paddr/256;
   // assign {r,g,b}=(x==px&&y<=py+3&&y>=py-3)||(y==py&&x<=px+3&&x>=px-3)?12'b111111111111:dpo;   
    assign {r,g,b}=dpo;
    always @(posedge clk_1p or posedge rst)
    begin
        if(rst)
        begin
            paddr<=256*128+128;
        end
        else
        begin
        case(dir)
        4'b1000: paddr<=paddr-256;
        4'b0100:  paddr<=paddr-1;
        4'b0010:  paddr<=paddr+1;
        4'b0001:  paddr<=paddr+256;
        4'b1100:  paddr<=paddr-257;
        4'b1010:  paddr<=paddr-255;
        4'b0101:  paddr<=paddr+255;
        4'b0011:  paddr<=paddr-257;
        endcase
//        if(dir[0])   //up
//        begin
//            paddr=paddr-256;
//        end
//        if(dir[1])   //left
//        begin
//            paddr=paddr-1;
//        end
//        if(dir[2])     //right
//        begin
//           paddr=paddr+1;
//        end
//        if(dir[3])    //down
//        begin
//           paddr=paddr+256;
//        end
        end
    end
    
    VGA qwer(clk_50m,rst,hs,vs,x,y);
endmodule
    
module VGA (
    // Clock requirement: 100 MHz
    input clk, rst,
    output hs, vs,
    output [15:0] x, y
);
    parameter HD = 800, HF = 56, HS = 120, HB = 64;
    parameter VD = 600, VF = 37, VS = 6, VB = 23;
   
    wire en;
    reg [15:0] hc, vc;
    assign x = en ? hc : 0;
    assign y = en ? vc : 0;
    assign en = (hc < 712) && (vc > 201) && ( vc < 457 )&&( hc> 456 );
    assign hs = (hc>=HS);
    assign vs = (vc>=VS);

    // VGA Scanner
    always @ (posedge clk or negedge rst)
        if(!rst) hc <= 11'd0;
        else if(hc == 11'd1039) hc <= 11'd0;
        else hc <= hc+1'b1;
    
    always @ (posedge clk or negedge rst)
        if(!rst) vc <= 10'd0;
        else if(vc == 10'd665) vc <= 10'd0;
        else if(hc == 11'd1039) vc <= vc+1'b1;
        
endmodule
