// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Sun Feb 12 09:37:36 2023"


module busmux_0(C_BMin,HI_BMin,INPORT_BMin,LO_BMin,MDR_BMin,PC_BMin,R0_BMin,R10_BMin,R11_BMin,R12_BMin,R13_BMin,R14_BMin,R15_BMin,R1_BMin,R2_BMin,R3_BMin,R4_BMin,R5_BMin,R6_BMin,R7_BMin,R8_BMin,R9_BMin,S,ZHI_BMin,ZLO_BMin,BusMuxOut);
input [31:0] C_BMin;
input [31:0] HI_BMin;
input [31:0] INPORT_BMin;
input [31:0] LO_BMin;
input [31:0] MDR_BMin;
input [31:0] PC_BMin;
input [31:0] R0_BMin;
input [31:0] R10_BMin;
input [31:0] R11_BMin;
input [31:0] R12_BMin;
input [31:0] R13_BMin;
input [31:0] R14_BMin;
input [31:0] R15_BMin;
input [31:0] R1_BMin;
input [31:0] R2_BMin;
input [31:0] R3_BMin;
input [31:0] R4_BMin;
input [31:0] R5_BMin;
input [31:0] R6_BMin;
input [31:0] R7_BMin;
input [31:0] R8_BMin;
input [31:0] R9_BMin;
input [4:0] S;
input [31:0] ZHI_BMin;
input [31:0] ZLO_BMin;
output [31:0] BusMuxOut;

busmux	lpm_instance(.C_BMin(C_BMin),.HI_BMin(HI_BMin),.INPORT_BMin(INPORT_BMin),.LO_BMin(LO_BMin),.MDR_BMin(MDR_BMin),.PC_BMin(PC_BMin),.R0_BMin(R0_BMin),.R10_BMin(R10_BMin),.R11_BMin(R11_BMin),.R12_BMin(R12_BMin),.R13_BMin(R13_BMin),.R14_BMin(R14_BMin),.R15_BMin(R15_BMin),.R1_BMin(R1_BMin),.R2_BMin(R2_BMin),.R3_BMin(R3_BMin),.R4_BMin(R4_BMin),.R5_BMin(R5_BMin),.R6_BMin(R6_BMin),.R7_BMin(R7_BMin),.R8_BMin(R8_BMin),.R9_BMin(R9_BMin),.S(S),.ZHI_BMin(ZHI_BMin),.ZLO_BMin(ZLO_BMin),.BusMuxOut(BusMuxOut));

endmodule
