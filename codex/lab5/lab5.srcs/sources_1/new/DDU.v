//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 2019/04/27 16:11:17
//// Design Name: 
//// Module Name: seg_display
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
module seg_display(clk,i_data,o_seg,o_an);
input clk;//100M
input [31:0]i_data;
output reg [6:0]o_seg;
output reg [7:0]o_an;
wire clk_5hz;
reg [2:0]state;
reg [25:0]cnt;
reg [3:0]number;

always @(posedge clk)
    cnt <= (cnt!= 200_000) ? cnt + 1: 1;    
assign clk_5hz = (cnt!=1); 

always @(posedge clk_5hz)
    begin
    o_an  <=  ~( 1 << state);
    state <=  state + 1;  
    end
    
always @(posedge clk_5hz)
case(state)
3'd0:   number <= i_data[3:0];       
3'd1:   number <= i_data[7:4];
3'd2:   number <= i_data[11:8];
3'd3:   number <= i_data[15:12];
3'd4:   number <= i_data[19:16];
3'd5:   number <= i_data[23:20];
3'd6:   number <= i_data[27:24];
3'd7:   number <= i_data[31:28];
endcase

always @(*)
case(number)
 4'h0 : o_seg = 7'b100_0000; //显示"0"
 4'h1 : o_seg = 7'b111_1001; //显示"1"
 4'h2 : o_seg = 7'b010_0100; //显示"2"
 4'h3 : o_seg = 7'b011_0000; //显示"3" 
 4'h4 : o_seg = 7'b001_1001; //显示"4"
 4'h5 : o_seg = 7'b001_0010; //显示"5"
 4'h6 : o_seg=  7'b000_0010; //显示"6"
 4'h7 : o_seg = 7'b111_1000; //显示"7"
 4'h8 : o_seg = 7'b000_0000; //显示"8"
 4'h9 : o_seg = 7'b001_0000; //显示"9"
 4'ha : o_seg = 7'b000_0100;//显示"A"
 4'hb : o_seg = 7'b000_0011;//显示"b"
 4'hc : o_seg = 7'b100_0110;//显示"c"
 4'hd : o_seg = 7'b010_0001;//显示"d"
 4'he:  o_seg = 7'b000_0110;//显示"E"
 4'hf:  o_seg = 7'b000_1110;//显示"F"
 endcase

endmodule

////module DDU(
////input cont,
////input step,
////input mem,
////input inc,
////input dec,
////input rst,
////input clk,
////output [7:0]led1,
////output [7:0]led2,
////output  [7:0]   an,
////output  [6:0]   seg
//// );
////wire     clk_1r;
////wire     clk_5m;
////reg      clk_1;
////wire     rst_n;
////reg     [31:0]  cnt1,cnt2,read;
////reg     [7:0]   seg_sel;
////reg     [3:0]   seg_din;  
////wire    [31:0]   data;
////wire     [31:0]  reg_data,mem_data;
////reg     [7:0]   mem_addr,reg_addr,pc;
////reg     run,flag;
////wire     [31:0] nowpc,ins,pcinit;
////clk_wiz_0   clk_wiz_0(
////        .clk_in1    (clk),
////        .clk_out1   (clk_5m),
////        .reset      (rst),
////        .locked     (rst_n)
////        );   

////always@(posedge clk_1)
////begin
////    if(rst)
////    begin
////        read <= 0;
////    end
////    else if(inc)
////        read=read+1;
////    else if (dec)
////        read=read-1;
////end
////always@(posedge clk_5m or negedge rst_n)
//// begin 
////    if(~rst_n)
////    begin
////        cnt1 <= 32'h0;
////        clk_1 <= 0;
////    end
////    else if(cnt1<32'd500000)
////        cnt1 <= cnt1 + 1;
////    else
////    begin
////        cnt1 <= 32'h0;
////        clk_1 <= ~clk_1;
////    end
////end  
//////always@(posedge clk_5m or negedge rst_n)
////// begin 
//////    if(~rst_n)
//////    begin
//////        cnt2 <= 32'h0;
//////        clk_1 <= 0;
//////    end
//////    else if(cnt1<32'd500000)
//////        cnt2 <= cnt2 + 1;
//////    else
//////    begin
//////        cnt2 <= 32'h0;
//////        clk_1 <= ~clk_1;
//////    end
//////end  
//////cont = 1：run = 1，控制CPU连续执行指令
//////cont = 0：每按动step一次，run输出维持一个时钟周期的脉冲，控制CPU执行一周期指令
////always@(step or cont)
////begin
////    if(step&&~cont)
////        flag=1;
////    else if (~step&&~cont)
////        flag=0;
////    else 
////        flag=1;
////end
////always@(posedge clk_1)
////begin
////    if(flag)
////        run=1;
////    else
////        run=0;
////end

////assign clk_1r= (run)? clk_1:0;
////assign pcinit=32'b00000000000000000000000000000000;
////processor processor(clk_1r,clk_50m,rst,pcinit,nowpc,ins,read,reg_data,mem_data);
////assign led1=read;
////assign led2=nowpc[7:0];
////assign data = ( mem ) ? mem_data : reg_data;
////seg_display(clk,data,seg,an);
//////mem： 1，查看MEM；0，查看RF
//////inc/dec：增加或减小待查看RF/MEM的地址addr
//////reg_data/mem_data：从RF/MEM读取的数据
//////8位数码管显示RF/MEM的一个32位数据
//////16位LED指示RF/MEM的地址和PC的值
//////assign led= (mem)? {mem_addr,pc}:{reg_addr,pc};

////endmodule


//module DDU(clk,rst,in,cont,step,mem,inc,dec,led,an,seg);
//input clk;//100M
//input in;
//input rst;
//input cont,step;//u运行方式
//input mem;//查看MEM/RF
//input inc,dec;//增加/减小待查看地址

//output [15:0]led;
//output [7:0]an;//数码管使能
//output [6:0]seg;
////output o_dp;
//reg   [4:0] reg_addr;
//reg         run;//运行cpu
//reg   [31:0]mem_addr;
//reg         lock;
//wire [31:0] data;
//wire        clk_run;//可被冻结的时钟
//wire [31:0] pc,pc_init;
//wire [31:0] mem_data,reg_data;
//wire        clk_10;
//wire        clk_1;
//reg   [30:0]cnt;
//reg   [3:0] cnt2;
//wire     [31:0] ins;
//always @(posedge clk)
//cnt <= (cnt!= 10_000_000) ? cnt + 1: 1;
//assign clk_10 = (cnt <= 5_000_000);
//always @(posedge clk_10)
//cnt2 <= (cnt2 != 10) ? cnt2 + 1 : 1;
//assign clk_1 = (cnt2 <= 5);
//seg_display seg_display(clk,data,seg,an);
//processor processor (clk_1,rst,pc_init,pc,ins,reg_addr,reg_data,mem_addr,mem_data,run);
//assign pc_init = 32'hffff_ffff;
//assign led  = (mem)? {mem_addr[7:0],pc[7:0]}:{3'b0,reg_addr,pc[7:0]};
//assign data   = (in)? ins : (mem)? mem_data : reg_data;
//assign clk_run  = (run) ? clk_10 : 0;
//always @(posedge clk_1)
//    if(rst)
//        reg_addr <= 5'b0;
//    else if (mem == 0)
//        if(inc)
//        reg_addr <= reg_addr + 1;
//        else if(dec)
//        reg_addr <= reg_addr - 1;
//always @(posedge clk_1)
//    if(rst)
//        mem_addr <= 32'b0;
//    else if (mem == 1)
//        if(inc)
//        mem_addr <= mem_addr + 1;
//        else if(dec)
//        mem_addr <= mem_addr  - 1;

//always@(posedge clk_10,posedge rst)
// if (rst) begin
//    run  <= 0;
//    lock <= 0;
// end
// else if (cont) begin
//        run  <= 1;
//        //lock <= lock;
//      end
//      else if( ~lock) begin//t locked
//                if( step ) begin
//                    run   <= 1;
//                    lock  <= 1;
//                end
//                else begin 
//                     run  <= 0;
//                     lock <= 0;
//                     end        
//           end
//           else begin//locked
//                run  <= 0;
//                lock <= (step) ? 1 : 0;//lock retore
//                end                   
//endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/23 18:34:56
// Design Name: 
// Module Name: DDU
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


module DDU(clk,rst,in,cont,step,mem,inc,dec,led,an,seg);
input in;
input clk;//100M
input rst;
input cont,step;//cpu运行方式
input mem;//查看MEM/RF
input inc,dec;//增加/减小待查看地址

output [15:0]led;
output [7:0]an;//数码管使能
output [6:0]seg;
//output o_dp;
reg   [4:0] reg_addr;
reg         run;//运行cpu
reg   [31:0]mem_addr;
reg         lock;
wire [31:0] data;
//wire        clk_run;//可被冻结的时钟
wire [31:0] pc,pc_init;
wire [31:0] mem_data,reg_data;
wire        clk_10;
wire        clk_1;
reg   [30:0]cnt;
reg   [3:0] cnt2;
wire [31:0]ins;
wire clk_r;
reg flag;
always @(posedge clk)
cnt <= (cnt!= 10_000_000) ? cnt + 1: 1;
assign clk_10 = (cnt <= 5_000_000);
always @(posedge clk_10)
cnt2 <= (cnt2 != 10) ? cnt2 + 1 : 1;
assign clk_1 = (cnt2 <= 5);
seg_display seg_display(clk,data,seg,an);
processor processor (clk_1,rst,pc_init,pc,ins,reg_addr,reg_data,mem_addr,mem_data,run);
assign pc_init = 32'hffffffff;
assign led  = (mem)? {mem_addr[7:0],pc[7:0]}:{3'b0,reg_addr,pc[7:0]};
assign data   = (in)? ins:(mem)? mem_data : reg_data;
always @(posedge clk_1)
    if(rst)
        reg_addr <= 5'b0;
    else if (mem == 0)
        if(inc)
        reg_addr <= reg_addr + 1;
        else if(dec)
        reg_addr <= reg_addr - 1;
always @(posedge clk_1)
    if(rst)
        mem_addr <= 32'b0;
    else if (mem == 1)
        if(inc)
        mem_addr <= mem_addr + 1;
        else if(dec)
        mem_addr <= mem_addr  - 1;
//assign clk_r=(run)? clk_1:0;
//always@(step or cont or pc)
//begin
//    if(flag&&step&&~cont)
//        run=1;
//    else if (~flag&&~cont)
//        run=0;
//    else if(cont)
//        run=1;
        
//end
//always@(run or rst)
//begin
//if(rst)
//flag=1;
//if(run)
//flag=0;
//else
//flag=1;
//end
always@(posedge clk_1,posedge rst)
 if (rst) begin
    run  <= 0;
    lock <= 0;
 end
 else if (cont) begin
        run  <= 1;
        //lock <= lock;
      end
      else if( ~lock) begin//not locked
                if( step ) begin
                    run   <= 1;
                    lock  <= 1;
                end
                else begin 
                     run  <= 0;
                     lock <= 0;
                     end        
           end
           else begin//locked
                run  <= 0;
                lock <= (step) ? 1 : 0;//lock retore
                end              
endmodule


//module DDU(
//input i_cont,
//input step,
//input mem,
//input inc,
//input dec,
//input rst,
//input clk,
//output [15:0]led,
//output  [7:0]   an,
//output  [6:0]   seg
// );
//wire     clk_1r;
//wire     clk_5m;
//reg      clk_1;
//wire     rst_n;
//reg     [31:0]  cnt1,cnt2,read;
//reg     [7:0]   seg_sel;
//reg     [3:0]   seg_din;  
//wire    [3:0]   data[7:0];
//wire     [31:0]  reg_data,mem_data;
//reg     [7:0]   mem_addr,reg_addr,pc;
//reg     run,flag;
//wire     [31:0] nowpc,ins,pcinit;
//clk_wiz_0   clk_wiz_0(
//        .clk_in1    (clk),
//        .clk_out1   (clk_5m),
//        .reset      (rst),
//        .locked     (rst_n)
//        );   
//seg_ctrl  seg_ctrl(
//     .x              (seg_din),
//     .sel            (seg_sel),
//     .an             (an),
//     .seg            (seg)
//     ); 
//always@(posedge clk_1)
//begin
//    if(~rst_n)
//    begin
//        read <= 0;
//    end
//    else if(inc)
//        read=read+1;
//    else if (dec)
//        read=read-1;
//end
//always@(posedge clk_5m or negedge rst_n)
// begin 
//    if(~rst_n)
//    begin
//        cnt1 <= 32'h0;
//        clk_1 <= 0;
//    end
//    else if(cnt1<32'd5000000)
//        cnt1 <= cnt1 + 1;
//    else
//    begin
//        cnt1 <= 32'h0;
//        clk_1 <= ~clk_1;
//    end
//end  
////cont = 1：run = 1，控制CPU连续执行指令
////cont = 0：每按动step一次，run输出维持一个时钟周期的脉冲，控制CPU执行一条指令
//always@(posedge clk_1) 
//begin    
//    if(step&&~cont)
//        flag=1;
//    if(rst)
//        flag=0;
//    if(cont)
//    begin
//        run<=1;
//    end
//    else if(flag==1)
//    begin
//        run<=1;
//        flag=0;
//    end
//    else if(flag==0)
//        run=0;
//end

//assign clk_1r= (run)? clk_1:0;
//assign pcinit=32'b00100000000010000000000000000001;
//processor processor (clk_1r,clk_50m,rst,pcinit,nowpc,ins,read,reg_data,mem_data);
//assign led={read[7:0],nowpc[7:0]};
////mem： 1，查看MEM；0，查看RF
////inc/dec：增加或减小待查看RF/MEM的地址addr
////reg_data/mem_data：从RF/MEM读取的数据
////8位数码管显示RF/MEM的一个32位数据
////16位LED指示RF/MEM的地址和PC的值
//assign data[7]= (mem)? mem_data%10:reg_data%10;
//assign data[6]= (mem)? (mem_data%100)/10:(reg_data%100)/10;
//assign data[5]= (mem)? (mem_data%1000)/100:(reg_data%1000)/100;
//assign data[4]= (mem)? (mem_data%10000)/1000:(reg_data%10000)/1000;
//assign data[3]= (mem)? (mem_data%100000)/10000:(reg_data%100000)/10000;
//assign data[2]= (mem)? (mem_data%1000000)/100000:(reg_data%1000000)/100000;
//assign data[1]= (mem)? (mem_data%10000000)/1000000:(reg_data%10000000)/1000000;
//assign data[0]= (mem)? (mem_data%100000000)/10000000:(reg_data%100000000)/10000000;
//assign led= (mem)? {mem_addr,pc}:{reg_addr,pc};
//    always@(posedge clk_5m or negedge rst_n)
//    begin
//        if(~rst_n)
//        begin
//            seg_sel <= 8'b0;
//            seg_din <= 10;
//        end
//        else case(cnt1[15:13])
//            3'b000:
//            begin
//                seg_sel <= 8'b0111_1111;    
//                seg_din <= data[0];
//            end
//            3'b001:
//            begin
//                seg_sel <= 8'b1011_1111;
//                seg_din <= data[1];
//            end
//            3'b010:
//            begin
//                seg_sel <= 8'b1101_1111;
//                seg_din <= data[2];
//            end
//            3'b011:
//            begin
//                seg_sel <= 8'b1110_1111; 
//                seg_din <= data[3];            
//            end        
//            3'b100:
//            begin
//                seg_sel <= 8'b1111_0111;                   
//                seg_din <= data[4];
//            end        
//            3'b101:
//            begin
//                seg_sel <= 8'b1111_1011;
//                seg_din <= data[5];
//            end        
//            3'b110:
//            begin
//                seg_sel <= 8'b1111_1101;
//                seg_din <= data[6];
//            end        
//            3'b111:  
//            begin
//                seg_sel <= 8'b1111_1110;
//                seg_din <= data[7];
//            end        
//            endcase      
//    end
//endmodule












