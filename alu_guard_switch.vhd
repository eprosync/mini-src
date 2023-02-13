library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_guard_switch is
	port (
		en : in std_logic;
		A_in, B_in : in std_logic_vector(31 downto 0);
		A_out, B_out : out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of alu_guard_switch is

begin
	 A_out <= A_in when (en='1') else x"0000_0000";
	 B_out <= B_in when (en='1') else x"0000_0000";
end architecture;

