`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/23 16:06:37
// Design Name: 
// Module Name: cu
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
////////////////////////////////////////////////////////////////////////////////////

//module ch(a,b,c,d);
//input [3:0]a,b;
//output reg [3:0]c,d;
//always@(*)
//begin
//    c=b;
//    d=a;
//end
//endmodule
    
module cu(x0,x1,x2,x3,s0,s1,s2,s3,clk,rst,done);
input [3:0]x0,x1,x2,x3;
output reg [3:0]s0,s1,s2,s3;
input rst,clk;
output reg done;
reg [3:0] flag;
reg [3:0] t0,t1,t2,t3,t;
always @(posedge clk)
    begin
        if(rst)
            begin
                s0=x0;
                s1=x1;
                s2=x2;
                s3=x3;
                flag=0;
                done=0;
                t0=x0;
                t1=x1;
                t2=x2;
                t3=x3;
            end
        else 
            begin
            if(t0>t1)
                begin
                    t=t0;
                    t0=t1;
                    t1=t;
                    flag=1;
                end
                if(t1>t2)
                begin
                     t=t1;
                     t1=t2;
                     t2=t;
                     flag=2;
                end
                if(t2>t3)
                begin
                        t=t2;
                        t2=t3;
                        t3=t;
                        flag=3;
                end
            if(flag==0)
                done=1;
            flag=0;
            s0=t0;
            s1=t1;
            s2=t2;
            s3=t3;
            end
    end
endmodule

module sort(x0,x1,x2,x3,s0,s1,s2,s3,clk,rst,done);
input [3:0]x0,x1,x2,x3;
output reg [3:0]s0,s1,s2,s3;
input rst,clk;
output reg done;
reg [3:0] flag;
reg [3:0] t0,t1,t2,t3,t;
reg [3:0] state,c_state,n_state;
always @(posedge clk )
begin
    if(rst)
    begin
        s0=x0;
        s1=x1;
        s2=x2;
        s3=x3;
        flag=0;
        done=0;
        t0=x0;
        t1=x1;
        t2=x2;
        t3=x3;
        c_state=0;
    end
    else
        c_state=n_state;
end
always @ (c_state)
begin
    case (c_state)
    0: n_state=c_state+1; //01
    1: n_state=c_state+1; //12
    2: n_state=c_state+1; //23
    3: n_state=c_state+1; //01
    4: n_state=c_state+1; //12
    5: n_state=c_state+1; //01
    endcase
end
always @ (posedge clk)
begin
    case(c_state)
       0: if(t0>t1)  begin t=t0;t0=t1; t1=t; end
       1: if(t1>t2)  begin t=t1;t1=t2; t2=t; end
       2: if(t2>t3)  begin t=t2;t2=t3; t3=t; end
       3: if(t0>t1)  begin t=t0;t0=t1; t1=t; end
       4: if(t1>t2)  begin t=t1;t1=t2; t2=t; end
       5: if(t0>t1)  begin t=t0;t0=t1; t1=t; end
       6: done=1;
    endcase
    s0=t0;
    s1=t1;
    s2=t2;
    s3=t3;
end

endmodule