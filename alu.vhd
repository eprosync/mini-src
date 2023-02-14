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
-- CREATED		"Mon Feb 13 20:55:48 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY alu IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		CS :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		C :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END alu;

ARCHITECTURE bdf_type OF alu IS 

COMPONENT op_add_32
	PORT(Cin : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Cout : OUT STD_LOGIC;
		 S : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu_32_to_64
	PORT(en : IN STD_LOGIC;
		 C_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu_guard_switch
	PORT(en : IN STD_LOGIC;
		 A_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 A_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT op_and_32
	PORT(A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu_op_combiner
	PORT(op_add_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_and_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_div_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_mul_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_negate_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_not_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_or_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_rol_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_ror_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_shl_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_shr_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 op_sub_in : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 C_out : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu_op_decider
	PORT(CS : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 op_add : OUT STD_LOGIC;
		 op_sub : OUT STD_LOGIC;
		 op_mul : OUT STD_LOGIC;
		 op_div : OUT STD_LOGIC;
		 op_and : OUT STD_LOGIC;
		 op_or : OUT STD_LOGIC;
		 op_shr : OUT STD_LOGIC;
		 op_shl : OUT STD_LOGIC;
		 op_ror : OUT STD_LOGIC;
		 op_rol : OUT STD_LOGIC;
		 op_not : OUT STD_LOGIC;
		 op_negate : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT op_div_32
	PORT(DM : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 DQ : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT op_mul_32
	PORT(M : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 P : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT op_not_32
	PORT(A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT op_or_32
	PORT(A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT op_rol_32
	PORT(A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT op_ror_32
	PORT(A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT op_shl_32
	PORT(A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT op_shr_32
	PORT(A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_75 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_76 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(0 TO 31);
SIGNAL	SYNTHESIZED_WIRE_77 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_78 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_79 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_46 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_80 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_48 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_51 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_81 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_53 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_82 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_58 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_60 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_61 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_83 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_63 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_65 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_66 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_67 :  STD_LOGIC_VECTOR(0 TO 31);
SIGNAL	SYNTHESIZED_WIRE_84 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_69 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_70 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_71 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_72 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_74 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_0 <= '0';
SYNTHESIZED_WIRE_29 <= '1';
SYNTHESIZED_WIRE_31 <= "00000000000000000000000000000000";
SYNTHESIZED_WIRE_65 <= '1';
SYNTHESIZED_WIRE_67 <= "00000000000000000000000000000000";
SYNTHESIZED_WIRE_70 <= '0';









b2v_op_add : op_add_32
PORT MAP(Cin => SYNTHESIZED_WIRE_0,
		 A => SYNTHESIZED_WIRE_1,
		 B => SYNTHESIZED_WIRE_2,
		 S => SYNTHESIZED_WIRE_4);


b2v_op_add_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_75,
		 C_in => SYNTHESIZED_WIRE_4,
		 C_out => SYNTHESIZED_WIRE_11);


b2v_op_add_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_75,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_1,
		 B_out => SYNTHESIZED_WIRE_2);


b2v_op_and : op_and_32
PORT MAP(A => SYNTHESIZED_WIRE_6,
		 B => SYNTHESIZED_WIRE_7,
		 C => SYNTHESIZED_WIRE_9);


b2v_op_and_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_76,
		 C_in => SYNTHESIZED_WIRE_9,
		 C_out => SYNTHESIZED_WIRE_12);


b2v_op_and_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_76,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_6,
		 B_out => SYNTHESIZED_WIRE_7);


b2v_op_combiner : alu_op_combiner
PORT MAP(op_add_in => SYNTHESIZED_WIRE_11,
		 op_and_in => SYNTHESIZED_WIRE_12,
		 op_div_in => SYNTHESIZED_WIRE_13,
		 op_mul_in => SYNTHESIZED_WIRE_14,
		 op_negate_in => SYNTHESIZED_WIRE_15,
		 op_not_in => SYNTHESIZED_WIRE_16,
		 op_or_in => SYNTHESIZED_WIRE_17,
		 op_rol_in => SYNTHESIZED_WIRE_18,
		 op_ror_in => SYNTHESIZED_WIRE_19,
		 op_shl_in => SYNTHESIZED_WIRE_20,
		 op_shr_in => SYNTHESIZED_WIRE_21,
		 op_sub_in => SYNTHESIZED_WIRE_22,
		 C_out => C);


b2v_op_decider : alu_op_decider
PORT MAP(CS => CS,
		 op_add => SYNTHESIZED_WIRE_75,
		 op_sub => SYNTHESIZED_WIRE_84,
		 op_mul => SYNTHESIZED_WIRE_28,
		 op_div => SYNTHESIZED_WIRE_25,
		 op_and => SYNTHESIZED_WIRE_76,
		 op_or => SYNTHESIZED_WIRE_79,
		 op_shr => SYNTHESIZED_WIRE_83,
		 op_shl => SYNTHESIZED_WIRE_82,
		 op_ror => SYNTHESIZED_WIRE_81,
		 op_rol => SYNTHESIZED_WIRE_80,
		 op_not => SYNTHESIZED_WIRE_78,
		 op_negate => SYNTHESIZED_WIRE_77);


b2v_op_div : op_div_32
PORT MAP(DM => SYNTHESIZED_WIRE_23,
		 DQ => SYNTHESIZED_WIRE_24,
		 Q => SYNTHESIZED_WIRE_13);


b2v_op_divide_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_25,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_23,
		 B_out => SYNTHESIZED_WIRE_24);


b2v_op_mul : op_mul_32
PORT MAP(M => SYNTHESIZED_WIRE_26,
		 Q => SYNTHESIZED_WIRE_27,
		 P => SYNTHESIZED_WIRE_14);


b2v_op_mul_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_28,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_26,
		 B_out => SYNTHESIZED_WIRE_27);


b2v_op_negate_2s_comp : op_add_32
PORT MAP(Cin => SYNTHESIZED_WIRE_29,
		 A => SYNTHESIZED_WIRE_30,
		 B => SYNTHESIZED_WIRE_31,
		 S => SYNTHESIZED_WIRE_33);


b2v_op_negate_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_77,
		 C_in => SYNTHESIZED_WIRE_33,
		 C_out => SYNTHESIZED_WIRE_15);


b2v_op_negate_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_77,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_35);


b2v_op_negate_not : op_not_32
PORT MAP(A => SYNTHESIZED_WIRE_35,
		 C => SYNTHESIZED_WIRE_30);


b2v_op_not : op_not_32
PORT MAP(A => SYNTHESIZED_WIRE_36,
		 C => SYNTHESIZED_WIRE_38);


b2v_op_not_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_78,
		 C_in => SYNTHESIZED_WIRE_38,
		 C_out => SYNTHESIZED_WIRE_16);


b2v_op_not_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_78,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_36);


b2v_op_or : op_or_32
PORT MAP(A => SYNTHESIZED_WIRE_40,
		 B => SYNTHESIZED_WIRE_41,
		 C => SYNTHESIZED_WIRE_43);


b2v_op_or_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_79,
		 C_in => SYNTHESIZED_WIRE_43,
		 C_out => SYNTHESIZED_WIRE_17);


b2v_op_or_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_79,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_40,
		 B_out => SYNTHESIZED_WIRE_41);


b2v_op_rol : op_rol_32
PORT MAP(A => SYNTHESIZED_WIRE_45,
		 B => SYNTHESIZED_WIRE_46,
		 C => SYNTHESIZED_WIRE_48);


b2v_op_rol_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_80,
		 C_in => SYNTHESIZED_WIRE_48,
		 C_out => SYNTHESIZED_WIRE_18);


b2v_op_rol_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_80,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_45,
		 B_out => SYNTHESIZED_WIRE_46);


b2v_op_ror : op_ror_32
PORT MAP(A => SYNTHESIZED_WIRE_50,
		 B => SYNTHESIZED_WIRE_51,
		 C => SYNTHESIZED_WIRE_53);


b2v_op_ror_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_81,
		 C_in => SYNTHESIZED_WIRE_53,
		 C_out => SYNTHESIZED_WIRE_19);


b2v_op_ror_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_81,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_50,
		 B_out => SYNTHESIZED_WIRE_51);


b2v_op_shl : op_shl_32
PORT MAP(A => SYNTHESIZED_WIRE_55,
		 B => SYNTHESIZED_WIRE_56,
		 C => SYNTHESIZED_WIRE_58);


b2v_op_shl_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_82,
		 C_in => SYNTHESIZED_WIRE_58,
		 C_out => SYNTHESIZED_WIRE_20);


b2v_op_shl_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_82,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_55,
		 B_out => SYNTHESIZED_WIRE_56);


b2v_op_shr : op_shr_32
PORT MAP(A => SYNTHESIZED_WIRE_60,
		 B => SYNTHESIZED_WIRE_61,
		 C => SYNTHESIZED_WIRE_63);


b2v_op_shr_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_83,
		 C_in => SYNTHESIZED_WIRE_63,
		 C_out => SYNTHESIZED_WIRE_21);


b2v_op_shr_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_83,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_60,
		 B_out => SYNTHESIZED_WIRE_61);


b2v_op_sub_2s_comp : op_add_32
PORT MAP(Cin => SYNTHESIZED_WIRE_65,
		 A => SYNTHESIZED_WIRE_66,
		 B => SYNTHESIZED_WIRE_67,
		 S => SYNTHESIZED_WIRE_72);


b2v_op_sub_64 : alu_32_to_64
PORT MAP(en => SYNTHESIZED_WIRE_84,
		 C_in => SYNTHESIZED_WIRE_69,
		 C_out => SYNTHESIZED_WIRE_22);


b2v_op_sub_adder : op_add_32
PORT MAP(Cin => SYNTHESIZED_WIRE_70,
		 A => SYNTHESIZED_WIRE_71,
		 B => SYNTHESIZED_WIRE_72,
		 S => SYNTHESIZED_WIRE_69);


b2v_op_sub_guard : alu_guard_switch
PORT MAP(en => SYNTHESIZED_WIRE_84,
		 A_in => A,
		 B_in => B,
		 A_out => SYNTHESIZED_WIRE_71,
		 B_out => SYNTHESIZED_WIRE_74);


b2v_op_sub_invert : op_not_32
PORT MAP(A => SYNTHESIZED_WIRE_74,
		 C => SYNTHESIZED_WIRE_66);


END bdf_type;