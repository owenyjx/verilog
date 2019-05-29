`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/23 17:14:27
// Design Name: 
// Module Name: lan2_1
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


module divide1(x,y,q,r,clk,rst,done,error);
input [3:0]x,y;
output reg [3:0]q,r;
input clk,rst;
output reg done,error;
reg [3:0]x1,y1,q1,r1,t;
always @(posedge clk)
begin
    if(rst)
        begin
            x1=x;
            y1=y;
            done=0;
            error=0;
            q1=0;
            r1=0;
        end
    if(y==0)
        begin
            error=1;
        end
    if(done==0)
        begin
            t=q1;
            q1=t+1;
            r1=x1-q1*y1;
            if(r1<y1)
                done=1;
        end
        q=q1;
        r=r1;
end
endmodule
module divide(x,y,q,r,clk,rst,done,error);
input [3:0]x,y;
output reg [3:0]q,r;
input clk,rst;
output reg done,error;
reg [3:0]x1,y1,q1,r1,t;
reg [1:0] c_state,n_state;
always @ (posedge clk) 
begin
    if(rst)
    begin    
        x1=x;
        y1=y;
        done=0;
        q1=0;
        r1=0;
        c_state=0;
        if(y==0)
            error=1;
        else
            error=0;
    end
    else
    begin
        c_state=n_state;       
    end
end
always @ (*)
begin
    case(c_state)
    0:begin if(r1<y1) n_state=1; else n_state=0;end
    endcase
end
always @ (posedge clk)
begin
    case(c_state)
    0: begin t=q1;q1=t+1; r1=x1-q1*y1;end
    1: done=1;
    endcase
    q=q1;
    r=r1;
end
endmodule
 











