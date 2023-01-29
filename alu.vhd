library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	-- A, B are inputs into ALU, like A * B, A + B, etc
	-- CS is the control signal, this selects what operator to use
	-- C is our results
	port (
		A, B : in signed(31 downto 0);
		CS : in std_logic_vector(3 downto 0);
		C : out signed(63 downto 0)
	);
end ALU;

architecture behaviour of ALU is

	begin
	
	process(A, B, CS) is
		-- variables area, idk
	begin
		case CS is
			-- the x"0000_0000_0000_0000" is an overhead for the 63 downto 0
			when "0000" => C <= (A + B) + x"0000_0000_0000_0000"; -- add
			when "0001" => C <= (A - B) + x"0000_0000_0000_0000"; -- sub
			when "0010" => C <= (A * B) + x"0000_0000_0000_0000"; -- mul
			when "0011" => C <= (A mod B) & (A / B); -- div
			when "0100" => C <= (A and B); -- and
			when "0101" => C <= (A or B); -- or
			when others => null;
		end case;
	end process;
	
end behaviour;