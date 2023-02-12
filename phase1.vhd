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
-- CREATED		"Sun Feb 12 09:20:25 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY phase1 IS 
	PORT
	(
		clear :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		R0in :  IN  STD_LOGIC;
		R1in :  IN  STD_LOGIC;
		R2in :  IN  STD_LOGIC;
		R3in :  IN  STD_LOGIC;
		R4in :  IN  STD_LOGIC;
		R5in :  IN  STD_LOGIC;
		R6in :  IN  STD_LOGIC;
		R7in :  IN  STD_LOGIC;
		PCin :  IN  STD_LOGIC;
		MDRin :  IN  STD_LOGIC;
		INPORTin :  IN  STD_LOGIC;
		Cin :  IN  STD_LOGIC;
		OUTPORTin :  IN  STD_LOGIC;
		R8in :  IN  STD_LOGIC;
		R9in :  IN  STD_LOGIC;
		R10in :  IN  STD_LOGIC;
		R11in :  IN  STD_LOGIC;
		R12in :  IN  STD_LOGIC;
		R13in :  IN  STD_LOGIC;
		R14in :  IN  STD_LOGIC;
		R15in :  IN  STD_LOGIC;
		HIin :  IN  STD_LOGIC;
		LOin :  IN  STD_LOGIC;
		ZHIin :  IN  STD_LOGIC;
		ZLOin :  IN  STD_LOGIC;
		R0out :  IN  STD_LOGIC;
		R1out :  IN  STD_LOGIC;
		R2out :  IN  STD_LOGIC;
		R3out :  IN  STD_LOGIC;
		R4out :  IN  STD_LOGIC;
		R5out :  IN  STD_LOGIC;
		R6out :  IN  STD_LOGIC;
		R7out :  IN  STD_LOGIC;
		R8out :  IN  STD_LOGIC;
		R9out :  IN  STD_LOGIC;
		R10out :  IN  STD_LOGIC;
		R11out :  IN  STD_LOGIC;
		R12out :  IN  STD_LOGIC;
		R13out :  IN  STD_LOGIC;
		R14out :  IN  STD_LOGIC;
		R15out :  IN  STD_LOGIC;
		HIout :  IN  STD_LOGIC;
		ZHIout :  IN  STD_LOGIC;
		ZLOout :  IN  STD_LOGIC;
		PCout :  IN  STD_LOGIC;
		MDRout :  IN  STD_LOGIC;
		INPORTout :  IN  STD_LOGIC;
		Cout :  IN  STD_LOGIC;
		LOout :  IN  STD_LOGIC;
		Read :  IN  STD_LOGIC;
		Yin :  IN  STD_LOGIC;
		Zin :  IN  STD_LOGIC;
		MARin :  IN  STD_LOGIC;
		IRin :  IN  STD_LOGIC;
		CS :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		MDatain :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxOut :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		HI_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		IR_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		LO_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R0_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R10_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R11_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R12_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R13_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R14_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R15_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R1_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R2_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R3_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R4_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R5_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R6_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R7_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R8_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R9_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Z_out :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END phase1;

ARCHITECTURE bdf_type OF phase1 IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT busmux_0
	PORT(C_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 HI_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 INPORT_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 LO_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 MDR_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 PC_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R0_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R10_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R11_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R12_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R13_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R14_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R15_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R1_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R2_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R3_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R4_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R5_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R6_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R7_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R8_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R9_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 S : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ZHI_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ZLO_BMin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BusMuxOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF busmux_0: COMPONENT IS true;
ATTRIBUTE noopt OF busmux_0: COMPONENT IS true;

COMPONENT alu
	PORT(A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 CS : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg32
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT encoder32to5
	PORT(R0_E32To5 : IN STD_LOGIC;
		 R1_E32To5 : IN STD_LOGIC;
		 R2_E32To5 : IN STD_LOGIC;
		 R3_E32To5 : IN STD_LOGIC;
		 R4_E32To5 : IN STD_LOGIC;
		 R5_E32To5 : IN STD_LOGIC;
		 R6_E32To5 : IN STD_LOGIC;
		 R7_E32To5 : IN STD_LOGIC;
		 R8_E32To5 : IN STD_LOGIC;
		 R9_E32To5 : IN STD_LOGIC;
		 R10_E32To5 : IN STD_LOGIC;
		 R11_E32To5 : IN STD_LOGIC;
		 R12_E32To5 : IN STD_LOGIC;
		 R13_E32To5 : IN STD_LOGIC;
		 R14_E32To5 : IN STD_LOGIC;
		 R15_E32To5 : IN STD_LOGIC;
		 HI_E32To5 : IN STD_LOGIC;
		 LO_E32To5 : IN STD_LOGIC;
		 ZHI_E32To5 : IN STD_LOGIC;
		 ZLO_E32To5 : IN STD_LOGIC;
		 PC_E32To5 : IN STD_LOGIC;
		 MDR_E32To5 : IN STD_LOGIC;
		 INPORT_E32To5 : IN STD_LOGIC;
		 C_E32To5 : IN STD_LOGIC;
		 S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mdmux
	PORT(ReadCmd : IN STD_LOGIC;
		 BusMuxOut : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Mdatain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 D : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg64
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT zsplit
	PORT(Z_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 ZHI : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ZLO : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_58 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_57 :  STD_LOGIC_VECTOR(63 DOWNTO 0);


BEGIN 
BusMuxOut <= SYNTHESIZED_WIRE_58;
HI_out <= SYNTHESIZED_WIRE_3;
LO_out <= SYNTHESIZED_WIRE_5;
R0_out <= SYNTHESIZED_WIRE_8;
R10_out <= SYNTHESIZED_WIRE_9;
R11_out <= SYNTHESIZED_WIRE_10;
R12_out <= SYNTHESIZED_WIRE_11;
R13_out <= SYNTHESIZED_WIRE_12;
R14_out <= SYNTHESIZED_WIRE_13;
R15_out <= SYNTHESIZED_WIRE_14;
R1_out <= SYNTHESIZED_WIRE_15;
R2_out <= SYNTHESIZED_WIRE_16;
R3_out <= SYNTHESIZED_WIRE_17;
R4_out <= SYNTHESIZED_WIRE_18;
R5_out <= SYNTHESIZED_WIRE_19;
R6_out <= SYNTHESIZED_WIRE_20;
R7_out <= SYNTHESIZED_WIRE_21;
R8_out <= SYNTHESIZED_WIRE_22;
R9_out <= SYNTHESIZED_WIRE_23;
Z_out <= SYNTHESIZED_WIRE_57;



b2v_ALU_Controller : alu
PORT MAP(A => SYNTHESIZED_WIRE_0,
		 B => SYNTHESIZED_WIRE_58,
		 CS => CS,
		 C => SYNTHESIZED_WIRE_54);


b2v_BusMux : busmux_0
PORT MAP(C_BMin => SYNTHESIZED_WIRE_2,
		 HI_BMin => SYNTHESIZED_WIRE_3,
		 INPORT_BMin => SYNTHESIZED_WIRE_4,
		 LO_BMin => SYNTHESIZED_WIRE_5,
		 MDR_BMin => SYNTHESIZED_WIRE_6,
		 PC_BMin => SYNTHESIZED_WIRE_7,
		 R0_BMin => SYNTHESIZED_WIRE_8,
		 R10_BMin => SYNTHESIZED_WIRE_9,
		 R11_BMin => SYNTHESIZED_WIRE_10,
		 R12_BMin => SYNTHESIZED_WIRE_11,
		 R13_BMin => SYNTHESIZED_WIRE_12,
		 R14_BMin => SYNTHESIZED_WIRE_13,
		 R15_BMin => SYNTHESIZED_WIRE_14,
		 R1_BMin => SYNTHESIZED_WIRE_15,
		 R2_BMin => SYNTHESIZED_WIRE_16,
		 R3_BMin => SYNTHESIZED_WIRE_17,
		 R4_BMin => SYNTHESIZED_WIRE_18,
		 R5_BMin => SYNTHESIZED_WIRE_19,
		 R6_BMin => SYNTHESIZED_WIRE_20,
		 R7_BMin => SYNTHESIZED_WIRE_21,
		 R8_BMin => SYNTHESIZED_WIRE_22,
		 R9_BMin => SYNTHESIZED_WIRE_23,
		 S => SYNTHESIZED_WIRE_24,
		 ZHI_BMin => SYNTHESIZED_WIRE_25,
		 ZLO_BMin => SYNTHESIZED_WIRE_26,
		 BusMuxOut => SYNTHESIZED_WIRE_58);


b2v_C_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => Cin,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_2);


b2v_HI_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => HIin,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_3);


b2v_INPORT_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => INPORTin,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_4);


b2v_inst : encoder32to5
PORT MAP(R0_E32To5 => R0out,
		 R1_E32To5 => R1out,
		 R2_E32To5 => R2out,
		 R3_E32To5 => R3out,
		 R4_E32To5 => R4out,
		 R5_E32To5 => R5out,
		 R6_E32To5 => R6out,
		 R7_E32To5 => R7out,
		 R8_E32To5 => R8out,
		 R9_E32To5 => R9out,
		 R10_E32To5 => R10out,
		 R11_E32To5 => R11out,
		 R12_E32To5 => R12out,
		 R13_E32To5 => R13out,
		 R14_E32To5 => R14out,
		 R15_E32To5 => R15out,
		 HI_E32To5 => HIout,
		 LO_E32To5 => LOout,
		 ZHI_E32To5 => ZHIout,
		 ZLO_E32To5 => ZLOout,
		 PC_E32To5 => PCout,
		 MDR_E32To5 => MDRout,
		 INPORT_E32To5 => INPORTout,
		 C_E32To5 => Cout,
		 S => SYNTHESIZED_WIRE_24);


b2v_IR_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => IRin,
		 d => SYNTHESIZED_WIRE_58,
		 q => IR_out);


b2v_LO_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => LOin,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_5);


b2v_MAR_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => MARin,
		 d => SYNTHESIZED_WIRE_58);


b2v_MDMux_Controller : mdmux
PORT MAP(ReadCmd => Read,
		 BusMuxOut => SYNTHESIZED_WIRE_58,
		 Mdatain => MDatain,
		 D => SYNTHESIZED_WIRE_34);


b2v_MDR_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => MDRin,
		 d => SYNTHESIZED_WIRE_34,
		 q => SYNTHESIZED_WIRE_6);


b2v_OUTPORT_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => OUTPORTin,
		 d => SYNTHESIZED_WIRE_58);


b2v_PC_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => PCin,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_7);


b2v_R0_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R0in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_8);


b2v_R10_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R10in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_9);


b2v_R11_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R11in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_10);


b2v_R12_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R12in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_11);


b2v_R13_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R13in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_12);


b2v_R14_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R14in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_13);


b2v_R15_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R15in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_14);


b2v_R1_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R1in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_15);


b2v_R2_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R2in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_16);


b2v_R3_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R3in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_17);


b2v_R4_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R4in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_18);


b2v_R5_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R5in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_19);


b2v_R6_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R6in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_20);


b2v_R7_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R7in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_21);


b2v_R8_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R8in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_22);


b2v_R9_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => R9in,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_23);


b2v_Y_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => Yin,
		 d => SYNTHESIZED_WIRE_58,
		 q => SYNTHESIZED_WIRE_0);


b2v_Z_Register : reg64
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => Zin,
		 d => SYNTHESIZED_WIRE_54,
		 q => SYNTHESIZED_WIRE_57);


b2v_ZHI_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => ZHIin,
		 d => SYNTHESIZED_WIRE_55,
		 q => SYNTHESIZED_WIRE_25);


b2v_ZLO_Register : reg32
PORT MAP(clk => clk,
		 reset_n => clear,
		 en => ZLOin,
		 d => SYNTHESIZED_WIRE_56,
		 q => SYNTHESIZED_WIRE_26);


b2v_ZSplitter : zsplit
PORT MAP(Z_in => SYNTHESIZED_WIRE_57,
		 ZHI => SYNTHESIZED_WIRE_55,
		 ZLO => SYNTHESIZED_WIRE_56);


END bdf_type;