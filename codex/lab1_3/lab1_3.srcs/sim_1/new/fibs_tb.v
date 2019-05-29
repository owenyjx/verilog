`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/19 20:48:31
// Design Name: 
// Module Name: fibs_tb
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


module fibs_tb( );
reg [2:0]a;
reg [2:0]b;
wire [7:0]y;
reg clk;
reg rst;
fibs DUT(.a(a),.b(b),.y(y),.clk(clk),.rst(rst));
initial
    begin
        a=1;b=1;clk=0;rst=0;
        forever
            begin
                #10 clk=1;
                #10 clk=0;
            end
    end
initial
    begin
        #5 rst=1;
        #10 rst=0;
    end
        
endmodule
