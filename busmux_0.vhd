-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
-- CREATED		"Sun Feb 12 09:58:01 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY altera;
USE altera.maxplus2.all; 

LIBRARY work;

ENTITY busmux_0 IS 
PORT 
( 
	C_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	HI_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	INPORT_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	LO_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	MDR_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	PC_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R0_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R10_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R11_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R12_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R13_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R14_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R15_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R1_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R2_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R3_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R4_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R5_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R6_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R7_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R8_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	R9_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	S	:	IN	 STD_LOGIC_VECTOR(4 DOWNTO 0);
	ZHI_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	ZLO_BMin	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	BusMuxOut	:	OUT	 STD_LOGIC_VECTOR(31 DOWNTO 0)
); 
END busmux_0;

ARCHITECTURE bdf_type OF busmux_0 IS 
BEGIN 

-- instantiate macrofunction 

b2v_BusMux : busmux
PORT MAP(C_BMin => C_BMin,
		 HI_BMin => HI_BMin,
		 INPORT_BMin => INPORT_BMin,
		 LO_BMin => LO_BMin,
		 MDR_BMin => MDR_BMin,
		 PC_BMin => PC_BMin,
		 R0_BMin => R0_BMin,
		 R10_BMin => R10_BMin,
		 R11_BMin => R11_BMin,
		 R12_BMin => R12_BMin,
		 R13_BMin => R13_BMin,
		 R14_BMin => R14_BMin,
		 R15_BMin => R15_BMin,
		 R1_BMin => R1_BMin,
		 R2_BMin => R2_BMin,
		 R3_BMin => R3_BMin,
		 R4_BMin => R4_BMin,
		 R5_BMin => R5_BMin,
		 R6_BMin => R6_BMin,
		 R7_BMin => R7_BMin,
		 R8_BMin => R8_BMin,
		 R9_BMin => R9_BMin,
		 S => S,
		 ZHI_BMin => ZHI_BMin,
		 ZLO_BMin => ZLO_BMin,
		 BusMuxOut => BusMuxOut);

END bdf_type; 