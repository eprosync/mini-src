library ieee;
use ieee.std_logic_1164.all;

entity encoder32to5 is
	port (
		R0,
		R1,
		R2,
		R3,
		R4,
		R5,
		R6,
		R7,
		R8,
		R9,
		R10,
		R11,
		R12,
		R13,
		R14,
		R15,
		HI,
		LO,
		ZHI,
		ZLO,
		PC,
		MDR,
		INPORT,
		C: in std_logic;
		
		S : out std_logic_vector (4 downto 0)
	);
end entity;

architecture behavior of encoder32to5 is
begin
	S <= "00000" when (R0='1' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"00001" when (R0='0' and R1='1' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"00010" when (R0='0' and R1='0' and R2='1' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"00011" when (R0='0' and R1='0' and R2='0' and R3='1' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"00100" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='1' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"00101" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='1' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"00110" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='1' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"00111" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='1' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"01000" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='1' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"01001" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='1' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"01010" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='1' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"01011" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='1' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"01100" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='1' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"01101" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='1' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"01110" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='1' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"01111" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='1' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"10000" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='1' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"10001" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='1' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"10010" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='1' and ZLO='0' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"10011" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='1' and PC='0' and MDR='0' and INPORT='0' and C='0') else
		"10100" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='1' and MDR='0' and INPORT='0' and C='0') else
		"10101" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='1' and INPORT='0' and C='0') else
		"10110" when (R0='0' and R1='0' and R2='0' and R3='0' and R4='0' and R5='0' and R6='0' and R7='0' and R8='0' and R9='0' and R10='0' and R11='0' and R12='0' and R13='0' and R14='0' and R15='0' and HI='0' and LO='0' and ZHI='0' and ZLO='0' and PC='0' and MDR='0' and INPORT='1' and C='0') else
		"10111" when ((R0='0') and (R1='0') and (R2='0') and (R3='0') and (R4='0') and (R5='0') and (R6='0') and (R7='0') and (R8='0') and (R9='0') and (R10='0') and (R11='0') and (R12='0') and (R13='0') and (R14='0') and (R15='0') and (HI='0') and (LO='0') and (ZHI='0') and (ZLO='0') and (PC='0') and (MDR='0') and (INPORT='0') and (C='1')) else
		"11111";
end architecture;