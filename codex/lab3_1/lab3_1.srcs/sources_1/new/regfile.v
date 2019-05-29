`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/31 09:54:47
// Design Name: 
// Module Name: regfile
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


module regfile(ra0,rd0,ra1,rd1,wa,wd,we,clk,rst);
parameter m=2;
parameter n=2;
input [m:0] ra0,ra1,wa;
input clk,rst,we;
input [n:0]wd;
output [n:0] rd0,rd1;
reg [m:0] i;
reg flag;
reg [n:0] register [n:0];
always @(posedge clk or posedge rst)
begin
    if(rst)
        begin
            flag=0;
            i=0;
        end
    else if(i<n)
        begin
            i=i+1;
            flag=0;
        end
     else 
        flag=1;
end
always @(posedge clk)
begin
    if(flag==0)
        begin 
            register[i]=0;
        end
    else 
        begin
            if(we&&wa)
                begin
                    register[wa]=wd;
                end
        end
end
assign rd0= (ra0)? register[ra0]:0;
assign rd1= (ra1)? register[ra1]:0;
endmodule

















