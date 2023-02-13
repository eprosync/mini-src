library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_64 is
	port (
		en : in std_logic;
		C_in : in std_logic_vector(63 downto 0);
		C_out : out std_logic_vector(63 downto 0)
	);
end entity;

architecture behavior of alu_64 is

begin
	process(C_in, en)
	begin
		case en is
			when '1' => C_out <= x"0000_0000_0000_0000";
			when others => null;
		end case;
	end process;
end architecture;

