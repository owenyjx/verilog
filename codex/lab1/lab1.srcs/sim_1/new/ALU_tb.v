`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/19 19:39:36
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(
    );
    reg [2:0] s;
    wire [5:0]y;
    reg [5:0] a,b;
    wire [2:0]f;
    ALU DUT(.s(s),.y(y),.a(a),.b(b),.f(f));
    initial 
        begin
            s=0;a=0;b=1;
            #10 a=1;b=5;
            #10 a=42;b=42;
            #10 s=1;a=15; b=14;
            #10 a=2; b=3;
            #10 s=2;b=3;a=3;
            #10 a=2;b=15;
            #10 s=3;a=14;b=15;
            #10 a=2;b=16;
            #10 s=4;a=34;b=15;
            #10 a=27;b=15;
            #10 s=5;a=25;b=15;
            #10 a=2;b=35;
        end
endmodule

















