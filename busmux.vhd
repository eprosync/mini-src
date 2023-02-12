library ieee;
use ieee.std_logic_1164.all;

entity BusMux is
	port (
		R0_BMin,
		R1_BMin,
		R2_BMin,
		R3_BMin,
		R4_BMin,
		R5_BMin,
		R6_BMin,
		R7_BMin,
		R8_BMin,
		R9_BMin,
		R10_BMin,
		R11_BMin,
		R12_BMin,
		R13_BMin,
		R14_BMin,
		R15_BMin,
		HI_BMin,
		LO_BMin,
		ZHI_BMin,
		ZLO_BMin,
		PC_BMin,
		MDR_BMin,
		INPORT_BMin,
		C_BMin
		: in std_logic_vector (31 downto 0);
	
		S : in std_logic_vector (4 downto 0);
		BusMuxOut : out std_logic_vector (31 downto 0)
	);
end entity;

architecture behavior of BusMux is
	
begin
	BusMuxOut <= R0_BMin when (S="00000") else
		R1_BMin when (S="00001") else
		R2_BMin when (S="00010") else
		R3_BMin when (S="00011") else
		R4_BMin when (S="00100") else
		R5_BMin when (S="00101") else
		R6_BMin when (S="00110") else
		R7_BMin when (S="00111") else
		R8_BMin when (S="01000") else
		R9_BMin when (S="01001") else
		R10_BMin when (S="01010") else
		R11_BMin when (S="01011") else
		R12_BMin when (S="01100") else
		R13_BMin when (S="01110") else
		R14_BMin when (S="01111") else
		R15_BMin when (S="10000") else
		HI_BMin when (S="10001") else
		LO_BMin when (S="10010") else
		ZHI_BMin when (S="10011") else
		ZLO_BMin when (S="10100") else
		PC_BMin when (S="10101") else
		INPORT_BMin when (S="10110") else
		C_BMin when (S="10111") else
		"00000000000000000000000000000000";
end architecture;