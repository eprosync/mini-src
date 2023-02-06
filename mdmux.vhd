library ieee;
use ieee.std_logic_1164.all;

entity MDMux is
	port (
		BusMuxOut, Mdatain : in std_logic_vector (31 downto 0);
		ReadCmd : in std_logic;
		D : out std_logic_vector (31 downto 0)
	);
end entity;

architecture behavior of MDMux is

begin
	D <= Mdatain when (ReadCmd='1') else BusMuxOut;
end architecture;