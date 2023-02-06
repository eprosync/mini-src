library ieee;
use ieee.std_logic_1164.all;

entity ZSplit is
	port (
		Z_in : in std_logic_vector (63 downto 0);
		ZHI, ZLO : out std_logic_vector (31 downto 0)
	);
end entity;

architecture behavior of ZSplit is

begin
	ZHI <= Z_in(63 downto 32);
	ZLO <= Z_in(31 downto 0);
end architecture;