library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity op_div_32 is 
	port(
		DM : in std_logic_vector(31 downto 0);
		DQ : in std_logic_vector(31 downto 0);
		Q : out std_logic_vector(63 downto 0)
	);
end entity;

architecture behavior of op_div_32 is

begin
	process (DM, DQ)
	variable temp_DM : signed(31 downto 0);
	variable temp_DQ : signed(31 downto 0);
	variable temp_Q : signed(63 downto 0);
	begin
		temp_DM := signed(DM);
		temp_DQ := signed(DQ);
		temp_Q := (temp_DM mod temp_DQ) & (temp_DM / temp_DQ);
		Q <= std_logic_vector(temp_Q);
	end process;
end architecture;