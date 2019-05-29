`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/23 16:53:08
// Design Name: 
// Module Name: cu_tb
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


module sort_tb( );
reg [3:0]x0,x1,x2,x3;
wire [3:0]s0,s1,s2,s3;
reg rst,clk;
wire done;
sort DUT (x0,x1,x2,x3,s0,s1,s2,s3,clk,rst,done);
initial
    begin
        clk=0;
        x0=4;
        x1=3;
        x2=2;
        x3=1;
        rst=1;
        forever 
            #10 clk=~clk;
    end
initial
    begin
    #15
    rst=0;
    end
endmodule
