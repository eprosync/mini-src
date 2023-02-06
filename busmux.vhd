library ieee;
use ieee.std_logic_1164.all;

entity BusMux is
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
		C
		: in std_logic_vector (31 downto 0);
	
		S : in std_logic_vector (4 downto 0);
		BusMuxOut : out std_logic_vector (31 downto 0)
	);
end entity;

architecture behavior of BusMux is
	
begin
	BusMuxOut <= R0 when (S="00000") else
		R1 when (S="00001") else
		R2 when (S="00010") else
		R3 when (S="00011") else
		R4 when (S="00100") else
		R5 when (S="00101") else
		R6 when (S="00110") else
		R7 when (S="00111") else
		R8 when (S="01000") else
		R9 when (S="01001") else
		R10 when (S="01010") else
		R11 when (S="01011") else
		R12 when (S="01100") else
		R13 when (S="01110") else
		R14 when (S="01111") else
		R15 when (S="10000") else
		HI when (S="10001") else
		LO when (S="10010") else
		ZHI when (S="10011") else
		ZLO when (S="10100") else
		PC when (S="10101") else
		INPORT when (S="10110") else
		C when (S="10111") else
		"00000000000000000000000000000000";
end architecture;