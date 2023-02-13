library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity op_and_32 is 
	port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		C : out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of op_and_32 is

begin
	process (A, B)
	
	begin
		for i in 0 to 31 loop
			C(i) <= (A(i) and B(i));
		end loop;
	end process;
end architecture;