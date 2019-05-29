// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Tue Mar 26 22:35:49 2019
// Host        : LAPTOP-1QU5OR1V running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               F:/2019spring/codex/lab2_1/lab2_1.sim/sim_1/synth/func/cu_tb_func_synth.v
// Design      : cu
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module cu
   (x0,
    x1,
    x2,
    x3,
    s0,
    s1,
    s2,
    s3,
    clk,
    rst,
    done);
  input [3:0]x0;
  input [3:0]x1;
  input [3:0]x2;
  input [3:0]x3;
  output [3:0]s0;
  output [3:0]s1;
  output [3:0]s2;
  output [3:0]s3;
  input clk;
  input rst;
  output done;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire done;
  wire done_OBUF;
  wire done_i_1_n_0;
  wire done_i_2_n_0;
  wire rst;
  wire rst_IBUF;
  wire [3:0]s0;
  wire \s0[3]_i_1_n_0 ;
  wire \s0[3]_i_3_n_0 ;
  wire [3:0]s0_OBUF;
  wire [3:0]s1;
  wire [3:0]s1_OBUF;
  wire [3:0]s2;
  wire \s2[0]_i_2_n_0 ;
  wire \s2[1]_i_2_n_0 ;
  wire \s2[1]_i_3_n_0 ;
  wire \s2[2]_i_2_n_0 ;
  wire \s2[2]_i_3_n_0 ;
  wire \s2[2]_i_4_n_0 ;
  wire \s2[2]_i_5_n_0 ;
  wire [3:0]s2_OBUF;
  wire [3:0]s3;
  wire \s3[0]_i_2_n_0 ;
  wire \s3[1]_i_2_n_0 ;
  wire \s3[2]_i_2_n_0 ;
  wire \s3[2]_i_3_n_0 ;
  wire \s3[3]_i_1_n_0 ;
  wire \s3[3]_i_3_n_0 ;
  wire \s3[3]_i_4_n_0 ;
  wire \s3[3]_i_5_n_0 ;
  wire \s3[3]_i_6_n_0 ;
  wire \s3[3]_i_7_n_0 ;
  wire \s3[3]_i_8_n_0 ;
  wire [3:0]s3_OBUF;
  wire [3:0]t0;
  wire [3:0]t1;
  wire [3:0]t2;
  wire [3:0]t3;
  wire [3:0]x0;
  wire [3:0]x0_IBUF;
  wire [3:0]x1;
  wire [3:0]x1_IBUF;
  wire [3:0]x2;
  wire [3:0]x2_IBUF;
  wire [3:0]x3;
  wire [3:0]x3_IBUF;

  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF done_OBUF_inst
       (.I(done_OBUF),
        .O(done));
  LUT5 #(
    .INIT(32'h00001051)) 
    done_i_1
       (.I0(\s3[3]_i_7_n_0 ),
        .I1(done_i_2_n_0),
        .I2(s3_OBUF[3]),
        .I3(s2_OBUF[3]),
        .I4(\s0[3]_i_3_n_0 ),
        .O(done_i_1_n_0));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    done_i_2
       (.I0(\s2[0]_i_2_n_0 ),
        .I1(s3_OBUF[0]),
        .I2(s3_OBUF[1]),
        .I3(\s2[1]_i_2_n_0 ),
        .I4(s3_OBUF[2]),
        .I5(\s3[3]_i_4_n_0 ),
        .O(done_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk_IBUF_BUFG),
        .CE(done_i_1_n_0),
        .D(done_i_1_n_0),
        .Q(done_OBUF),
        .R(rst_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \s0[0]_i_1 
       (.I0(x0_IBUF[0]),
        .I1(s1_OBUF[0]),
        .I2(rst_IBUF),
        .O(t0[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \s0[1]_i_1 
       (.I0(x0_IBUF[1]),
        .I1(s1_OBUF[1]),
        .I2(rst_IBUF),
        .O(t0[1]));
  LUT3 #(
    .INIT(8'hAC)) 
    \s0[2]_i_1 
       (.I0(x0_IBUF[2]),
        .I1(s1_OBUF[2]),
        .I2(rst_IBUF),
        .O(t0[2]));
  LUT2 #(
    .INIT(4'hE)) 
    \s0[3]_i_1 
       (.I0(\s0[3]_i_3_n_0 ),
        .I1(rst_IBUF),
        .O(\s0[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \s0[3]_i_2 
       (.I0(x0_IBUF[3]),
        .I1(s1_OBUF[3]),
        .I2(rst_IBUF),
        .O(t0[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    \s0[3]_i_3 
       (.I0(\s3[2]_i_3_n_0 ),
        .I1(s1_OBUF[3]),
        .I2(s0_OBUF[3]),
        .O(\s0[3]_i_3_n_0 ));
  OBUF \s0_OBUF[0]_inst 
       (.I(s0_OBUF[0]),
        .O(s0[0]));
  OBUF \s0_OBUF[1]_inst 
       (.I(s0_OBUF[1]),
        .O(s0[1]));
  OBUF \s0_OBUF[2]_inst 
       (.I(s0_OBUF[2]),
        .O(s0[2]));
  OBUF \s0_OBUF[3]_inst 
       (.I(s0_OBUF[3]),
        .O(s0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \s0_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\s0[3]_i_1_n_0 ),
        .D(t0[0]),
        .Q(s0_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s0_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\s0[3]_i_1_n_0 ),
        .D(t0[1]),
        .Q(s0_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s0_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\s0[3]_i_1_n_0 ),
        .D(t0[2]),
        .Q(s0_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s0_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\s0[3]_i_1_n_0 ),
        .D(t0[3]),
        .Q(s0_OBUF[3]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAAAACFC0)) 
    \s1[0]_i_1 
       (.I0(x1_IBUF[0]),
        .I1(s2_OBUF[0]),
        .I2(\s3[3]_i_7_n_0 ),
        .I3(\s3[0]_i_2_n_0 ),
        .I4(rst_IBUF),
        .O(t1[0]));
  LUT5 #(
    .INIT(32'hAAAACFC0)) 
    \s1[1]_i_1 
       (.I0(x1_IBUF[1]),
        .I1(s2_OBUF[1]),
        .I2(\s3[3]_i_7_n_0 ),
        .I3(\s3[1]_i_2_n_0 ),
        .I4(rst_IBUF),
        .O(t1[1]));
  LUT5 #(
    .INIT(32'hAAAACFC0)) 
    \s1[2]_i_1 
       (.I0(x1_IBUF[2]),
        .I1(s2_OBUF[2]),
        .I2(\s3[3]_i_7_n_0 ),
        .I3(\s3[2]_i_2_n_0 ),
        .I4(rst_IBUF),
        .O(t1[2]));
  LUT5 #(
    .INIT(32'hAAAACFC0)) 
    \s1[3]_i_1 
       (.I0(x1_IBUF[3]),
        .I1(s2_OBUF[3]),
        .I2(\s3[3]_i_7_n_0 ),
        .I3(\s3[3]_i_6_n_0 ),
        .I4(rst_IBUF),
        .O(t1[3]));
  OBUF \s1_OBUF[0]_inst 
       (.I(s1_OBUF[0]),
        .O(s1[0]));
  OBUF \s1_OBUF[1]_inst 
       (.I(s1_OBUF[1]),
        .O(s1[1]));
  OBUF \s1_OBUF[2]_inst 
       (.I(s1_OBUF[2]),
        .O(s1[2]));
  OBUF \s1_OBUF[3]_inst 
       (.I(s1_OBUF[3]),
        .O(s1[3]));
  FDRE #(
    .INIT(1'b0)) 
    \s1_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(t1[0]),
        .Q(s1_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(t1[1]),
        .Q(s1_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(t1[2]),
        .Q(s1_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s1_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(t1[3]),
        .Q(s1_OBUF[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAAAAACCCFCCC0)) 
    \s2[0]_i_1 
       (.I0(x2_IBUF[0]),
        .I1(s3_OBUF[0]),
        .I2(\s2[2]_i_2_n_0 ),
        .I3(\s2[2]_i_3_n_0 ),
        .I4(\s2[0]_i_2_n_0 ),
        .I5(rst_IBUF),
        .O(t2[0]));
  LUT5 #(
    .INIT(32'hACAACCAC)) 
    \s2[0]_i_2 
       (.I0(\s3[0]_i_2_n_0 ),
        .I1(s2_OBUF[0]),
        .I2(\s2[1]_i_3_n_0 ),
        .I3(s2_OBUF[3]),
        .I4(\s3[3]_i_6_n_0 ),
        .O(\s2[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAACCCFCCC0)) 
    \s2[1]_i_1 
       (.I0(x2_IBUF[1]),
        .I1(s3_OBUF[1]),
        .I2(\s2[2]_i_2_n_0 ),
        .I3(\s2[2]_i_3_n_0 ),
        .I4(\s2[1]_i_2_n_0 ),
        .I5(rst_IBUF),
        .O(t2[1]));
  LUT5 #(
    .INIT(32'hACAACCAC)) 
    \s2[1]_i_2 
       (.I0(\s3[1]_i_2_n_0 ),
        .I1(s2_OBUF[1]),
        .I2(\s2[1]_i_3_n_0 ),
        .I3(s2_OBUF[3]),
        .I4(\s3[3]_i_6_n_0 ),
        .O(\s2[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    \s2[1]_i_3 
       (.I0(\s3[0]_i_2_n_0 ),
        .I1(s2_OBUF[0]),
        .I2(s2_OBUF[1]),
        .I3(\s3[1]_i_2_n_0 ),
        .I4(s2_OBUF[2]),
        .I5(\s3[2]_i_2_n_0 ),
        .O(\s2[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAACCCFCCC0)) 
    \s2[2]_i_1 
       (.I0(x2_IBUF[2]),
        .I1(s3_OBUF[2]),
        .I2(\s2[2]_i_2_n_0 ),
        .I3(\s2[2]_i_3_n_0 ),
        .I4(\s3[3]_i_4_n_0 ),
        .I5(rst_IBUF),
        .O(t2[2]));
  LUT6 #(
    .INIT(64'hB2BB22B200000000)) 
    \s2[2]_i_2 
       (.I0(\s3[3]_i_4_n_0 ),
        .I1(s3_OBUF[2]),
        .I2(\s2[1]_i_2_n_0 ),
        .I3(s3_OBUF[1]),
        .I4(\s2[2]_i_4_n_0 ),
        .I5(\s2[2]_i_5_n_0 ),
        .O(\s2[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEE44E44)) 
    \s2[2]_i_3 
       (.I0(\s3[3]_i_7_n_0 ),
        .I1(s2_OBUF[3]),
        .I2(\s0[3]_i_3_n_0 ),
        .I3(s1_OBUF[3]),
        .I4(s0_OBUF[3]),
        .I5(s3_OBUF[3]),
        .O(\s2[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFB24D00)) 
    \s2[2]_i_4 
       (.I0(\s3[3]_i_6_n_0 ),
        .I1(s2_OBUF[3]),
        .I2(\s2[1]_i_3_n_0 ),
        .I3(s2_OBUF[0]),
        .I4(\s3[0]_i_2_n_0 ),
        .I5(s3_OBUF[0]),
        .O(\s2[2]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hA9)) 
    \s2[2]_i_5 
       (.I0(s3_OBUF[3]),
        .I1(\s3[3]_i_6_n_0 ),
        .I2(s2_OBUF[3]),
        .O(\s2[2]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \s2[3]_i_1 
       (.I0(x2_IBUF[3]),
        .I1(s3_OBUF[3]),
        .I2(\s3[3]_i_3_n_0 ),
        .I3(rst_IBUF),
        .O(t2[3]));
  OBUF \s2_OBUF[0]_inst 
       (.I(s2_OBUF[0]),
        .O(s2[0]));
  OBUF \s2_OBUF[1]_inst 
       (.I(s2_OBUF[1]),
        .O(s2[1]));
  OBUF \s2_OBUF[2]_inst 
       (.I(s2_OBUF[2]),
        .O(s2[2]));
  OBUF \s2_OBUF[3]_inst 
       (.I(s2_OBUF[3]),
        .O(s2[3]));
  FDRE #(
    .INIT(1'b0)) 
    \s2_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(t2[0]),
        .Q(s2_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s2_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(t2[1]),
        .Q(s2_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s2_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(t2[2]),
        .Q(s2_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s2_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(t2[3]),
        .Q(s2_OBUF[3]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \s3[0]_i_1 
       (.I0(x3_IBUF[0]),
        .I1(\s3[0]_i_2_n_0 ),
        .I2(s2_OBUF[0]),
        .I3(\s3[3]_i_7_n_0 ),
        .I4(rst_IBUF),
        .O(t3[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hACAACCAC)) 
    \s3[0]_i_2 
       (.I0(s0_OBUF[0]),
        .I1(s1_OBUF[0]),
        .I2(\s3[2]_i_3_n_0 ),
        .I3(s1_OBUF[3]),
        .I4(s0_OBUF[3]),
        .O(\s3[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \s3[1]_i_1 
       (.I0(x3_IBUF[1]),
        .I1(\s3[1]_i_2_n_0 ),
        .I2(s2_OBUF[1]),
        .I3(\s3[3]_i_7_n_0 ),
        .I4(rst_IBUF),
        .O(t3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC)) 
    \s3[1]_i_2 
       (.I0(s0_OBUF[1]),
        .I1(s1_OBUF[1]),
        .I2(\s3[2]_i_3_n_0 ),
        .I3(s1_OBUF[3]),
        .I4(s0_OBUF[3]),
        .O(\s3[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \s3[2]_i_1 
       (.I0(x3_IBUF[2]),
        .I1(\s3[2]_i_2_n_0 ),
        .I2(s2_OBUF[2]),
        .I3(\s3[3]_i_7_n_0 ),
        .I4(rst_IBUF),
        .O(t3[2]));
  LUT5 #(
    .INIT(32'hACAACCAC)) 
    \s3[2]_i_2 
       (.I0(s0_OBUF[2]),
        .I1(s1_OBUF[2]),
        .I2(\s3[2]_i_3_n_0 ),
        .I3(s1_OBUF[3]),
        .I4(s0_OBUF[3]),
        .O(\s3[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    \s3[2]_i_3 
       (.I0(s0_OBUF[0]),
        .I1(s1_OBUF[0]),
        .I2(s1_OBUF[1]),
        .I3(s0_OBUF[1]),
        .I4(s1_OBUF[2]),
        .I5(s0_OBUF[2]),
        .O(\s3[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFB2BB22B2)) 
    \s3[3]_i_1 
       (.I0(\s3[3]_i_3_n_0 ),
        .I1(s3_OBUF[3]),
        .I2(\s3[3]_i_4_n_0 ),
        .I3(s3_OBUF[2]),
        .I4(\s3[3]_i_5_n_0 ),
        .I5(rst_IBUF),
        .O(\s3[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hAAAACCF0)) 
    \s3[3]_i_2 
       (.I0(x3_IBUF[3]),
        .I1(\s3[3]_i_6_n_0 ),
        .I2(s2_OBUF[3]),
        .I3(\s3[3]_i_7_n_0 ),
        .I4(rst_IBUF),
        .O(t3[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s3[3]_i_3 
       (.I0(s2_OBUF[3]),
        .I1(\s3[3]_i_6_n_0 ),
        .O(\s3[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hECAE)) 
    \s3[3]_i_4 
       (.I0(s2_OBUF[2]),
        .I1(\s3[2]_i_2_n_0 ),
        .I2(s2_OBUF[3]),
        .I3(\s3[3]_i_6_n_0 ),
        .O(\s3[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4)) 
    \s3[3]_i_5 
       (.I0(\s3[3]_i_7_n_0 ),
        .I1(s2_OBUF[0]),
        .I2(\s3[0]_i_2_n_0 ),
        .I3(s3_OBUF[0]),
        .I4(s3_OBUF[1]),
        .I5(\s2[1]_i_2_n_0 ),
        .O(\s3[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \s3[3]_i_6 
       (.I0(s0_OBUF[3]),
        .I1(s1_OBUF[3]),
        .I2(\s0[3]_i_3_n_0 ),
        .O(\s3[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hB2FF00B2)) 
    \s3[3]_i_7 
       (.I0(\s3[3]_i_8_n_0 ),
        .I1(s2_OBUF[2]),
        .I2(\s3[2]_i_2_n_0 ),
        .I3(s2_OBUF[3]),
        .I4(\s3[3]_i_6_n_0 ),
        .O(\s3[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4)) 
    \s3[3]_i_8 
       (.I0(\s0[3]_i_3_n_0 ),
        .I1(s1_OBUF[0]),
        .I2(s0_OBUF[0]),
        .I3(s2_OBUF[0]),
        .I4(s2_OBUF[1]),
        .I5(\s3[1]_i_2_n_0 ),
        .O(\s3[3]_i_8_n_0 ));
  OBUF \s3_OBUF[0]_inst 
       (.I(s3_OBUF[0]),
        .O(s3[0]));
  OBUF \s3_OBUF[1]_inst 
       (.I(s3_OBUF[1]),
        .O(s3[1]));
  OBUF \s3_OBUF[2]_inst 
       (.I(s3_OBUF[2]),
        .O(s3[2]));
  OBUF \s3_OBUF[3]_inst 
       (.I(s3_OBUF[3]),
        .O(s3[3]));
  FDRE #(
    .INIT(1'b0)) 
    \s3_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\s3[3]_i_1_n_0 ),
        .D(t3[0]),
        .Q(s3_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s3_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\s3[3]_i_1_n_0 ),
        .D(t3[1]),
        .Q(s3_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s3_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\s3[3]_i_1_n_0 ),
        .D(t3[2]),
        .Q(s3_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s3_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\s3[3]_i_1_n_0 ),
        .D(t3[3]),
        .Q(s3_OBUF[3]),
        .R(1'b0));
  IBUF \x0_IBUF[0]_inst 
       (.I(x0[0]),
        .O(x0_IBUF[0]));
  IBUF \x0_IBUF[1]_inst 
       (.I(x0[1]),
        .O(x0_IBUF[1]));
  IBUF \x0_IBUF[2]_inst 
       (.I(x0[2]),
        .O(x0_IBUF[2]));
  IBUF \x0_IBUF[3]_inst 
       (.I(x0[3]),
        .O(x0_IBUF[3]));
  IBUF \x1_IBUF[0]_inst 
       (.I(x1[0]),
        .O(x1_IBUF[0]));
  IBUF \x1_IBUF[1]_inst 
       (.I(x1[1]),
        .O(x1_IBUF[1]));
  IBUF \x1_IBUF[2]_inst 
       (.I(x1[2]),
        .O(x1_IBUF[2]));
  IBUF \x1_IBUF[3]_inst 
       (.I(x1[3]),
        .O(x1_IBUF[3]));
  IBUF \x2_IBUF[0]_inst 
       (.I(x2[0]),
        .O(x2_IBUF[0]));
  IBUF \x2_IBUF[1]_inst 
       (.I(x2[1]),
        .O(x2_IBUF[1]));
  IBUF \x2_IBUF[2]_inst 
       (.I(x2[2]),
        .O(x2_IBUF[2]));
  IBUF \x2_IBUF[3]_inst 
       (.I(x2[3]),
        .O(x2_IBUF[3]));
  IBUF \x3_IBUF[0]_inst 
       (.I(x3[0]),
        .O(x3_IBUF[0]));
  IBUF \x3_IBUF[1]_inst 
       (.I(x3[1]),
        .O(x3_IBUF[1]));
  IBUF \x3_IBUF[2]_inst 
       (.I(x3[2]),
        .O(x3_IBUF[2]));
  IBUF \x3_IBUF[3]_inst 
       (.I(x3[3]),
        .O(x3_IBUF[3]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
