library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_op_decider is
	port (
		CS : in std_logic_vector(3 downto 0);
		op_add, op_sub, op_mul, op_div,
		op_and, op_or, op_shr, op_shl,
		op_ror, op_rol, op_not, op_negate : out std_logic
	);
end alu_op_decider;

architecture behavior of alu_op_decider is

begin
	 process(CS)
	 
	 begin
		 -- before anything, we need to setup all the pins
		 -- don't want multiple of these on!
		 op_add <= '0';
		 op_sub <= '0';
		 op_mul <= '0';
		 op_div <= '0';
		 op_and <= '0';
		 op_or <= '0';
		 op_shr <= '0';
		 op_shl <= '0';
		 op_ror <= '0';
		 op_rol <= '0';
		 op_not <= '0';
		 op_negate <= '0';
	 
		 case CS is
			  when "0000" =>
					op_add <= '1';
			  when "0001" => 
					op_sub <= '1';
			  when "0010" => 
					op_mul <= '1';
			  when "0011" => 
					op_div <= '1';
			  when "0100" => 
					op_and <= '1';
			  when "0101" => 
					op_or <= '1';
			  when "0110" => 
					op_shr <= '1';
			  when "0111" => 
					op_shl <= '1';
			  when "1000" => 
					op_ror <= '1';
			  when "1001" => 
					op_rol <= '1';
			  when "1010" => 
					op_not <= '1';
			  when "1011" => 
					op_negate <= '1';
			  when others => null;
		 end case;
	 end process;
end architecture;

