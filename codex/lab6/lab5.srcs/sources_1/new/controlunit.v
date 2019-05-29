`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 09:42:08
// Design Name: 
// Module Name: controlunit
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



module controlunit(rst,clk,OpCode,PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite,PCSource,ALUOp,ALUSrcB,ALUSrcA,RegWrite,RegDst,run);
input rst,clk,run;
input [5:0] OpCode;
output reg PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite;
output reg ALUSrcA,RegWrite,RegDst;
output reg [1:0] ALUOp,ALUSrcB,PCSource;
reg [3:0]next_state,state;


always @(posedge clk) begin
    if(rst) state <= 4'hf;
    else    state <= next_state;
end

always @(state,run )
begin
    case (state)
    4'hf: next_state = (run) ? 4'h0 : 4'hf;//idle
    4'h0: next_state = 4'h1;
    4'h1: begin
        case (OpCode)
        6'b000000:  next_state = 4'h6;//r_type
        6'b100011:  next_state = 4'h2;//lw
        6'b101011:  next_state = 4'h2;//sw
        6'b000100:  next_state = 4'h8;//BEQ
        6'b000101:  next_state = 4'hc;//BNE
        6'b000010:  next_state = 4'h9;//J
        default:    next_state = 4'ha;//immediate
        endcase     
    end              
    4'h2:begin          
        case (OpCode)
        6'b100011:  next_state = 4'h3;//lw
        6'b101011:  next_state = 4'h5;//sw        
    endcase
    end
    4'h3: next_state = 4'h4;
    4'h4: next_state = (run) ? 4'h0 : 4'hf;
    4'h5: next_state = (run) ? 4'h0 : 4'hf;
    4'h6: next_state = 4'h7;
    4'h7: next_state = (run) ? 4'h0 : 4'hf;
    4'h8: next_state = (run) ? 4'h0 : 4'hf;
    4'h9: next_state = (run) ? 4'h0 : 4'hf;
    4'ha: next_state = 4'hb;
    4'hb: next_state = (run) ? 4'h0 : 4'hf;
    4'hc: next_state = (run) ? 4'h0 : 4'hf;
    default next_state = (run) ? 4'h0 : 4'hf;
    endcase
end
always@(posedge clk)
begin
//    PCWriteCond=0;
//    PCWrite=0;
//    lorD=0;
//    MemRead=0;
//    MemWrite=0;
//    MemtoReg=0;
//    IRWrite=0;
//    ALUSrcA=0;
//    RegWrite=0;
//    RegDst=0;
//    PCSource=2'b0;
//    ALUOp=2'b00;
//    ALUSrcB=2'b00;
    case(next_state)
    4'h0:begin
    PCWriteCond <=0;
    PCWrite     <=1;
    lorD        <=0;
    MemRead     <=1;
    MemWrite    <=0;
    IRWrite     <=1;
    PCSource    <=2'b00;
    ALUOp       <=2'b00;
    ALUSrcB     <=2'b01;
    ALUSrcA     <=0;
    RegWrite    <=0;
    
    
    end         
    4'h1:begin    
    ALUOp       <=2'b00;
    ALUSrcB     <=2'b11;
    ALUSrcA     <=0;
    PCSource    <=2'b00;
    PCWrite     <=0;
    RegWrite    <=0;
    MemWrite    <=0;
    end
    4'h2:begin
    ALUOp       <=2'b00;
    ALUSrcB     <=2'b10;
    ALUSrcA     <=1;
    PCSource    <=2'b00;
    PCWrite     <=0;
    RegWrite    <=0;
    MemWrite    <=0;
    end
    4'h3:begin
    lorD        <=1;
    MemRead     <=1;
    PCSource    <=2'b00;
    PCWrite     <=0;
    RegWrite    <=0;
    MemWrite    <=0;
    end
    4'h4:begin
    MemtoReg    <=1;
    RegWrite    <=1;
    RegDst      <=0;
    PCSource    <=2'b00;
    PCWrite     <=0;
    MemWrite    <=0;
    end
    4'h5:begin
    lorD        <=1;
    MemWrite    <=1;
    PCSource    <=2'b00;
    PCWrite     <=0;
    RegWrite    <=0;
    end
    4'h6:begin
    ALUOp       <=2'b10;
    ALUSrcB     <=2'b00;
    ALUSrcA     <=1;
    PCSource    <=2'b00;
    PCWrite     <=0;
    RegWrite    <=0;
    MemWrite    <=0;
    end
    4'h7:begin
    MemtoReg    <=0;
    RegWrite    <=1;
    RegDst      <=1;
    PCSource    <=2'b00;
    PCWrite     <=0;
    MemWrite    <=0;
    end
    4'h8:begin
    PCWriteCond <=1;
    PCSource    <=2'b01;
    ALUOp       <=2'b01;
    ALUSrcB     <=2'b00;
    ALUSrcA     <=1;
    PCWrite     <=0;
    RegWrite    <=0;
    MemWrite    <=0;
    end
    4'h9:begin
    PCWrite     <=0;
    PCSource    <=2'b10;
    RegWrite    <=0;
    MemWrite    <=0;
    end
    4'ha:begin
    ALUOp       <=2'b10;
    ALUSrcB     <=2'b10;
    ALUSrcA     <=1;
    PCSource    <=2'b00;
    PCWrite     <=0;
    RegWrite    <=0;
    MemWrite    <=0;
    end
    4'hb:begin
    MemtoReg    <=0;
    RegWrite    <=1;
    RegDst      <=0;
    PCSource    <=2'b00;
    PCWrite     <=0;
    MemWrite    <=0;
    end
    4'hc:begin
    PCWriteCond <=1;
    PCSource    <=2'b01;
    ALUOp       <=2'b11;
    ALUSrcB     <=2'b00;
    ALUSrcA     <=1;
    PCWrite     <=0;
    RegWrite    <=0;
    MemWrite    <=0;
    end
    default PCWrite <= 0;
    endcase
end


//NextState NextState(cstate,OpCode,nstate);
//OutPutFunc OutPutFunc(clk,cstate,PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite,PCSource,ALUOp,ALUSrcB,ALUSrcA,RegWrite,RegDst);
endmodule
//module controlunit(rst,clk,OpCode,PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite,PCSource,ALUOp,ALUSrcB,ALUSrcA,RegWrite,RegDst,run);
//input rst,clk,run;
//input [5:0]OpCode;
//output reg PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite,ALUSrcA,RegWrite,RegDst;
//output reg [1:0] ALUOp,ALUSrcB,PCSource;
//reg [3:0]nstate,cstate;


//always @(posedge clk or posedge rst) begin
//    if (rst) cstate <= 0;
//    else cstate <= nstate;
//end
//always @(cstate or 1)
//begin
//    case (cstate)
//    0:nstate=1;
//    1:
//    begin
//        case (OpCode)
//        6'b000000:nstate=6;//r_type
//        6'b100011:nstate=2;//lw
//        6'b101011:nstate=2;//sw
//        6'b000100:nstate=8;//BEQ
//        6'b000101:nstate=12;//BNE
//        6'b000010:nstate=9;//J
//        default: nstate=10;//lijishu
//        endcase
//    end
//    2:
//    begin
//        case (OpCode)
//        6'b100011:nstate=3;//lw
//        6'b101011:nstate=5;//sw        
//    endcase
//    end
//    3:nstate=4;
//    4:nstate = (1)? 0:13;
//    5:nstate = (1)? 0:13;
//    6:nstate=7;
//    7:nstate = (1)? 0:13;
//    8:nstate = (1)? 0:13;
//    9:nstate = (1)? 0:13;
//    10:nstate=11;
//    11:nstate = (1)? 0:13;
//    12:nstate = (1)? 0:13;
//    13:nstate = (1)? 0:13;
//    endcase
//end
//always@( clk)
//begin
////    PCWriteCond=0;
////    PCWrite=0;
////    lorD=0;
////    MemRead=0;
////    MemWrite=0;
////    MemtoReg=0;
////    IRWrite=0;
////    ALUSrcA=0;
////    RegWrite=0;
////    RegDst=0;
////    PCSource=2'b0;
////    ALUOp=2'b00;
////    ALUSrcB=2'b00;
//    case(cstate)
//    0:
//    begin
//    PCWrite=1;
//    lorD=0;
//    MemRead=1;
//    IRWrite=1;
//    PCSource=2'b00;
//    ALUOp=2'b00;
//    ALUSrcB=2'b01;
//    ALUSrcA=0;
//    RegWrite=0;
//    MemWrite=0;
//    PCWriteCond=0;
//    end
//    1:
//    begin
//    ALUOp=2'b00;
//    ALUSrcB=2'b11;
//    ALUSrcA=0;
//    PCSource=2'b00;
//    PCWrite=0;
//    RegWrite=0;
//    MemWrite=0;
//    PCWriteCond=0;
//    end
//    2:
//    begin
//    ALUOp=2'b00;
//    ALUSrcB=2'b10;
//    ALUSrcA=1;
//    PCSource=2'b00;
//    PCWrite=0;
//    RegWrite=0;
//    MemWrite=0;
//    PCWriteCond=0;
//    end
//    3:
//    begin
//    lorD=1;
//    MemRead=1;
//    PCSource=2'b00;
//    PCWrite=0;
//    RegWrite=0;
//    MemWrite=0;
//    PCWriteCond=0;
//    end
//    4:
//    begin
//    MemtoReg=1;
//    RegWrite=1;
//    RegDst=0;
//    PCSource=2'b00;
//    PCWrite=0;
//    MemWrite=0;
//    PCWriteCond=0;
//    end
//    5:
//    begin
//    lorD=1;
//    MemWrite=1;
//    PCSource=2'b00;
//    PCWrite=0;
//    RegWrite=0;
//    PCWriteCond=0;
//    end
//    6:
//    begin
//    ALUOp=2'b10;
//    ALUSrcB=2'b00;
//    ALUSrcA=1;
//    PCSource=2'b00;
//    PCWrite=0;
//    RegWrite=0;
//    MemWrite=0;
//    PCWriteCond=0;
//    end
//    7:
//    begin
//    MemtoReg=0;
//    RegWrite=1;
//    RegDst=1;
//    PCSource=2'b00;
//    PCWrite=0;
//    MemWrite=0;
//    PCWriteCond=0;
//    end
//    8:
//    begin
//    PCWriteCond=1;
//    PCSource=2'b01;
//    ALUOp=2'b01;
//    ALUSrcB=2'b00;
//    ALUSrcA=1;
//    PCWrite=0;
//    RegWrite=0;
//    MemWrite=0;
//    end
//    9:
//    begin
//    PCWrite=0;
//    PCSource=2'b10;
//    RegWrite=0;
//    MemWrite=0;
//    PCWriteCond=0;
//    end
//    10:
//        begin
//        ALUOp=2'b10;
//        ALUSrcB=2'b10;
//        ALUSrcA=1;
//        PCSource=2'b00;
//        PCWrite=0;
//        RegWrite=0;
//        MemWrite=0;
//        PCWriteCond=0;
//        end
//   11:
//        begin
//        MemtoReg=0;
//        RegWrite=1;
//        RegDst=0;
//        PCSource=2'b00;
//        PCWrite=0;
//        MemWrite=0;
//        PCWriteCond=0;
//        end
//    12:
//        begin
//        PCWriteCond=1;
//        PCSource=2'b01;
//        ALUOp=2'b11;
//        ALUSrcB=2'b00;
//        ALUSrcA=1;
//        PCWrite=0;
//        RegWrite=0;
//        MemWrite=0;
//        end
//        default:PCWrite=0;
//    endcase
//end


//NextState NextState(cstate,OpCode,nstate);
//OutPutFunc OutPutFunc(clk,cstate,PCWriteCond,PCWrite,lorD,MemRead,MemWrite,MemtoReg,IRWrite,PCSource,ALUOp,ALUSrcB,ALUSrcA,RegWrite,RegDst);
//endmodule