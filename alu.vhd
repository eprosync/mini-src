library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	-- A, B are inputs into ALU, like A * B, A + B, etc
	-- CS is the control signal, this selects what operator to use
	-- C is our results
	port (
		A, B : in std_logic_vector(31 downto 0);
		CS : in std_logic_vector(3 downto 0);
		C : out std_logic_vector(63 downto 0)
	);
end ALU;

architecture behaviour of ALU is

	begin
	
	process(A, B, CS) is
		-- convert to signed for mega-operators
		variable A_signed, B_signed : signed(31 downto 0);
		variable C_signed : signed(63 downto 0);
	begin
		A_signed := signed(A);
		B_signed := signed(B);
		case CS is
			-- the x"0000_0000_0000_0000" is an overhead for the 63 downto 0
			when "0000" => C_signed := (A_signed + B_signed) + x"0000_0000_0000_0000"; -- add
			when "0001" => C_signed := (A_signed - B_signed) + x"0000_0000_0000_0000"; -- sub
			when "0010" => C_signed := (A_signed * B_signed) + x"0000_0000_0000_0000"; -- mul
			when "0011" => C_signed := (A_signed mod B_signed) & (A_signed / B_signed); -- div
			when "0100" => C_signed := (A_signed and B_signed) + x"0000_0000_0000_0000"; -- and
			when "0101" => C_signed := (A_signed or B_signed) + x"0000_0000_0000_0000"; -- or
			when others => null;
		end case;
		C <= std_logic_vector(C_signed);
	end process;
	
end behaviour;