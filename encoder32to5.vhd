library ieee;
use ieee.std_logic_1164.all;

entity Encoder32To5 is
	port (
		R0_E32To5,
		R1_E32To5,
		R2_E32To5,
		R3_E32To5,
		R4_E32To5,
		R5_E32To5,
		R6_E32To5,
		R7_E32To5,
		R8_E32To5,
		R9_E32To5,
		R10_E32To5,
		R11_E32To5,
		R12_E32To5,
		R13_E32To5,
		R14_E32To5,
		R15_E32To5,
		HI_E32To5,
		LO_E32To5,
		ZHI_E32To5,
		ZLO_E32To5,
		PC_E32To5,
		MDR_E32To5,
		INPORT_E32To5,
		C_E32To5: in std_logic;
		
		S : out std_logic_vector (4 downto 0)
	);
end entity;

architecture behavior of Encoder32To5 is
begin
	S <= "00000" when (R0_E32To5='1' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"00001" when (R0_E32To5='0' and R1_E32To5='1' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"00010" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='1' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"00011" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='1' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"00100" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='1' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"00101" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='1' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"00110" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='1' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"00111" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='1' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"01000" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='1' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"01001" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='1' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"01010" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='1' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"01011" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='1' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"01100" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='1' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"01101" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='1' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"01110" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='1' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"01111" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='1' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"10000" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='1' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"10001" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='1' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"10010" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='1' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"10011" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='1' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"10100" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='1' and MDR_E32To5='0' and INPORT_E32To5='0' and C_E32To5='0') else
		"10101" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='1' and INPORT_E32To5='0' and C_E32To5='0') else
		"10110" when (R0_E32To5='0' and R1_E32To5='0' and R2_E32To5='0' and R3_E32To5='0' and R4_E32To5='0' and R5_E32To5='0' and R6_E32To5='0' and R7_E32To5='0' and R8_E32To5='0' and R9_E32To5='0' and R10_E32To5='0' and R11_E32To5='0' and R12_E32To5='0' and R13_E32To5='0' and R14_E32To5='0' and R15_E32To5='0' and HI_E32To5='0' and LO_E32To5='0' and ZHI_E32To5='0' and ZLO_E32To5='0' and PC_E32To5='0' and MDR_E32To5='0' and INPORT_E32To5='1' and C_E32To5='0') else
		"10111" when ((R0_E32To5='0') and (R1_E32To5='0') and (R2_E32To5='0') and (R3_E32To5='0') and (R4_E32To5='0') and (R5_E32To5='0') and (R6_E32To5='0') and (R7_E32To5='0') and (R8_E32To5='0') and (R9_E32To5='0') and (R10_E32To5='0') and (R11_E32To5='0') and (R12_E32To5='0') and (R13_E32To5='0') and (R14_E32To5='0') and (R15_E32To5='0') and (HI_E32To5='0') and (LO_E32To5='0') and (ZHI_E32To5='0') and (ZLO_E32To5='0') and (PC_E32To5='0') and (MDR_E32To5='0') and (INPORT_E32To5='0') and (C_E32To5='1')) else
		"11111";
end architecture;