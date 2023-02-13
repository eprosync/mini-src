library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity op_shr_32 is 
	port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		C : out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of op_shr_32 is

begin
	process (A, B)
		variable temp_A : signed(31 downto 0);
		variable temp_B : signed(31 downto 0);
	begin
		temp_A := signed(A);
		temp_B := signed(B);
		C <= std_logic_vector(temp_A srl to_integer(temp_B));
	end process;
end architecture;