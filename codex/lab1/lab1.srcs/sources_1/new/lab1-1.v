`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/17 14:12:55
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

//module REG(
//input clk,
//input in,
//input en,
//input rst,
//output out
//);
//always @(posedge clk)
//    begin 
        
//    end
//endmodule
module ALU(
input [2:0] s,
output reg [5:0]y,
input [5:0] a,b,
output reg [2:0]f
    );
    reg [6:0]t;
    reg [6:0] a1;
    reg [6:0]b1;    
    
always @(*) 
begin
    if(s==0)
        begin 
            a1=a;
            b1=b;
            t=a1+b1;
            y=a+b;
            f=t[6];
            if(y==0)
                  f=4;
        end
    else if(s==1)
        begin
            y=a-b;
            if(a<b)
            f=2;
            else 
            f=0;
            if(y==0)
                f=4;
        end
    else if(s==2)
        begin
            y[0]=a[0]&&b[0];
            y[1]=a[1]&&b[1];
            y[2]=a[2]&&b[2];
            y[3]=a[3]&&b[3];
            y[4]=a[4]&&b[4];
            y[5]=a[5]&&b[5];
            if(y==0)
            f=4;
        end
    else if(s==3)
        begin
            y[0]=a[0]||b[0];
            y[1]=a[1]||b[1];
            y[2]=a[2]||b[2];
            y[3]=a[3]||b[3];
            y[4]=a[4]||b[4];
            y[5]=a[5]||b[5];
            if(y==0)
                f=4;
        end
    else if(s==4)
        begin
            y[0]=~a[0];
            y[1]=~a[1];
            y[2]=~a[2];
            y[3]=~a[3];
            y[4]=~a[4];
            y[5]=~a[5]; 
            if(y==0)
                        f=4;    
        end
    else if(s==5)
        begin
            y[0]=a[0]^b[0];
            y[1]=a[1]^b[1];
            y[2]=a[2]^b[2];
            y[3]=a[3]^b[3];
            y[4]=a[4]^b[4];
            y[5]=a[5]^b[5];
            if(y==0)
                        f=4;
        end
 end
endmodule















