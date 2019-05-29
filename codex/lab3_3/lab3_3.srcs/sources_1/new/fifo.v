//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 2019/04/01 10:27:01
//// Design Name: 
//// Module Name: fifo
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

//reg [3:0]queue[7:0];
//module judge (i,j,empty,full);
//input [3:0] i;
//input [3:0] j;
//output reg empty;
//output reg full;
//always @ (*)
//begin
//    empty=0;
//    full=0;
//    if(i==j)
//        empty=1;
//    if(j-i==1|i-j==7)
//        full=1;
//end
//endmodule
//module enqueue(i,in,full,i1);
//input [3:0] i;
//input [3:0]in;
//input full;
//output reg i1;
//always @ (*)
//begin
//    if(!full)
//    begin
//        queue[i]=in;
//        if(i+1>7)
//            i1=0;
//        else 
//            i1=i+1;
//    end
//end
//endmodule
//module dequeue(j,out,empty,j1);
//input j;
//output reg out;
//input empty;
//output reg j1;
//always @ (*)
//begin
//    if(!empty)
//    begin
//        out=queue[j];
//        if(j+1>7)
//            j1=0;
//        else
//            j1=j+1;   
//    end
//end
//endmodule
//module fifo(en_out,en_in,in,rst,clk,full,empty,out);
//input en_out,en_in,rst,clk;
//input [3:0]in ;
//output full,empty;
//output [3:0]out;
//reg [3:0]i;
//reg flag;
//reg [3:0] i,j;
//always @ (posedge clk or posedge rst)
//begin
//    if(rst)
//    begin
//        i=0;
//        flag=0;
//        i=0;
//        j=0;
//    end
//    else if(i<7)
//    begin
//        i=i+1;
//        flag=0;
//    end
//    else
//        flag=1;
//end
//always @ (posedge clk)
//begin
//    if(flag==0)
//        queue[i]=0;
//    else
//    begin
//        judge (i,j,full,empty);
//    end
//end
//always @ (posedge en_in)
//begin
//    if(en_in&&flag)
//        enqueue (i,in,full,i);
//end
//always @ (posedge en_out)
//begin
//    if(en_out&&flag)
//        dequeue (j,in,empty,j);
//end
//endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/01 10:27:01
// Design Name: 
// Module Name: fifo
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
//////////////////////////////////////////////////////////////////////////////////]

//module enqueue(clk,en_in,flag,i,in,full,i1,queue);
//input clk;
//input en_in;
//input flag;
//input [3:0] i;
//input [3:0]in;
//input full;
//output reg i1;
//input  [3:0]queue[7:0];
//reg [3:0]queue1 [7:0];
//reg [3:0]n;
//always @ (posedge en_in)
//begin
//    for(n=0;n<=7;n=n+1)
//    begin
//        queue1[n]=queue[n];
//    end
//    if(!full&&flag&&en_in)
//    begin
//        queue1[i]=in;
//        if(i+1>7)
//            i1=0;
//        else 
//            i1=i+1;
//    end
//end
//endmodule
//module dequeue(clk,en_out,flag,j,empty,j1);
//input en_out;
//input clk;
//input flag;
//input j;
//input empty;
//output reg j1;
//always @ (posedge en_out)
//begin
//    if(!empty&&flag&&en_out)
//    begin
//        queue[j]=0;
//        if(j+1>7)
//            j1=0;
//        else
//            j1=j+1;   
//    end
//end
//endmodule
//module judge (i,j,empty,full,clk);
//input clk;
//input [3:0] i;
//input [3:0] j;
//output reg empty;
//output reg full;
//always @ (posedge clk)
//begin
//    empty=0;
//    full=0;
//    if(i==j)
//        empty=1;
//    if(j-i==1|i-j==7)
//        full=1;
//end
//endmodule
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
4'b1010:seg=7'b1110111;
default:seg=7'b0110000;
endcase
end
endmodule
module fifo(en_out,en_in,in,rst,clk,full,empty,out,i1,j1,an,seg,dp);   //tem0,tem1,tem2,tem3,tem4,tem5,tem6,tem7,i1,j1,
input en_out,en_in,rst,clk;
input [3:0]in ;
output reg full,empty;
output reg [3:0] out;
output reg [3:0] i1,j1;
output  [7:0]   an;
output  [6:0]   seg;
output reg dp;
reg flag;
reg [3:0] i,j,count;
reg [3:0]queue[7:0];
reg tag;
reg     [7:0]   seg_sel;
reg     [3:0]   seg_din;    
reg     [31:0]  cnt,cnt5; 
wire    clk_5m;
wire    rst_n;
reg fl;
reg inflag,outflag;
clk_wiz_0   clk_wiz_0(
.clk_in1    (clk),
.clk_out1   (clk_5m),
.reset      (rst),
.locked     (rst_n)
);    
always @ (posedge clk_5m or posedge rst)
begin
    if(rst)
    begin
        i=0;
        j=0;
        tag=0;
        out=0;
        for(count=0;count<8;count=count+1)
        begin
            queue[count]=10;
        end
        inflag=1;
        outflag=1;
    end
    else if(en_in&&!full&&inflag)
        begin
        inflag=0;
        queue[i]=in;
        i=(i==7)? 0:i+1;
        tag=1;
        end
    else if(en_out&&!empty&&outflag)
        begin
        outflag=0;
        out=queue[j];
        queue[j]=10;
        j=(j==7)? 0:j+1;
        tag=0;
        end
    else if(!en_in || !en_out)
    begin
        if(!en_in)
        inflag=1;
        if(!en_out)
        outflag=1;
    end
end
//always @ (posedge clk)
//begin
//    if(flag==0)
//        queue[count]=10;
//    else
//    begin

//        j1=j;
//        i1=i;
//        tag=0;
//    end
//end

always @ (posedge clk_5m)
begin
    empty=0;
    full=0;
    if(i==j)
    begin
        if(tag==0)
        empty=1;
        if(tag==1)
        full=1;
     end
     i1=i;
     j1=j;
end
//always @ (posedge clk)
//begin
//    //fl=0;
//    if(en_in)
//    begin
//       // fl=1;
//        queue[i]=in;
//        i=i+1;
//    end
//    else if(en_out)
//    begin
//        //fl=1;
//        out=queue[j];
//        queue[j]=10;
//        j=j+1;
//    end
//end

//always @ (i or j)
//begin
//    if(i==8)
//        i=0;
//    else if (j==8)
//        j=0;
//end

//always @ ( posedge clk)
//begin
//    if(!full&&flag&&en_in)
//    begin
//    queue[i]=in;
//    tag=1;
//    if(i+1>7)
//        i=0;
//    else 
//        i=i+1;
//    end
//    if(!empty&&flag&&en_out)
//    begin
//        out=queue[j];
//        queue[j]=10;
//        tag=0;
//        if(j+1>7)
//            j=0;
//        else
//            j=j+1;   
//    end
//end

//always @ (posedge clk)
//begin
//    if(!empty&&flag&&en_out)
//    begin
//        out=queue[j];
//        queue[j]=10;
//        tag=0;
//        if(j+1>7)
//            j=0;
//        else
//            j=j+1;   
//    end
//end



seg_ctrl  seg_ctrl(
 .x              (seg_din),
 .sel            (seg_sel),
 .an             (an),
 .seg            (seg)
 ); 

always@(posedge clk_5m or negedge rst_n)
 begin 
    if(~rst_n)
        cnt <= 32'h0;
    else if(cnt<32'd5000000)
        cnt <= cnt + 1;
    else
        cnt <= 32'h0;
 end

always@(posedge clk_5m or negedge rst_n)
begin
    if(~rst_n)
    begin
        seg_sel <= 8'b0;
        seg_din <= 10;
    end
    else case(cnt[15:13])
        3'b000:
        begin
            seg_sel <= 8'b0111_1111;    
            seg_din <= queue[0];
            if(j1==0)
                dp=0;
            else
                dp=1;
        end
        3'b001:
        begin
            seg_sel <= 8'b1011_1111;
            seg_din <= queue[1];
            if(j1==1)
                dp=0;
            else
                dp=1;
        end
        3'b010:
        begin
            seg_sel <= 8'b1101_1111;
            seg_din <= queue[2];
            if(j1==2)
                dp=0;
            else
                dp=1;
        end
        3'b011:
        begin
            seg_sel <= 8'b1110_1111; 
            seg_din <= queue[3];            
            if(j1==3)
                dp=0;
            else
                dp=1;
        end        
        3'b100:
        begin
            seg_sel <= 8'b1111_0111;                   
            seg_din <= queue[4];
            if(j1==4)
                dp=0;
            else
                dp=1;
        end        
        3'b101:
        begin
            seg_sel <= 8'b1111_1011;
            seg_din <= queue[5];
            if(j1==5)
                dp=0;
            else
                dp=1;
        end        
        3'b110:
        begin
            seg_sel <= 8'b1111_1101;
            seg_din <= queue[6];
            if(j1==6)
                dp=0;
            else
                dp=1;
        end        
        3'b111:  
        begin
            seg_sel <= 8'b1111_1110;
            seg_din <= queue[7];
            if(j1==7)
                dp=0;
            else
                dp=1;
        end        
        endcase      
end
endmodule














