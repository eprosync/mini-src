library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity booth_32_bitPair is 
	port(
		M: in signed(31 DOWNTO 0); -- Multiplicand
		Q: in signed(31 DOWNTO 0); -- Multiplier
		P: out signed(63 DOWNTO 0)
	);
end entity;

architecture behavior of booth_32_bitPair is

begin
	process (M, Q)
		-- we will be adding onto the product_storage
		variable product_storage : signed (63 downto 0); -- this is our result
		
		-- this is used to keep track of what 2-bit pair pattern to select from
		variable multiplier_storage : signed (31 downto 0);
		
		-- this is to check what we will be adding
		variable multiplicand_storage : signed (31 downto 0);
		
		-- this is used simply as the pattern to match for when pairing
		variable M_bit_pattern : signed (2 downto 0);
	begin
		-- setup our variables
		product_storage := x"0000_0000_0000_0000";
		multiplier_storage := Q;
		multiplicand_storage := M;
		M_bit_pattern := Q(2 downto 0);
		
		-- since this is 2-bit pairing, we need to only travel half the amount of bits
		for bit_offset in 0 to 15 loop
			
			-- check what pattern to use
			case M_bit_pattern is
				-- "000" and "111" are ignored, since they are 0 x M
				when "001" => -- +1 x M
					product_storage := product_storage + multiplicand_storage;
				when "010" => -- +1 x M
					product_storage := product_storage + multiplicand_storage;
				when "011" => -- +2 x M
					product_storage := product_storage + (multiplicand_storage + multiplicand_storage);
				when "100" => -- -2 x M
					product_storage := product_storage - (multiplicand_storage + multiplicand_storage);
				when "101" => -- -1 x M
					product_storage := product_storage - (multiplicand_storage);
				when "110" => -- -1 x M
					product_storage := product_storage - (multiplicand_storage);
				when others => null;
			end case;
			
			-- shift our multiplicand by 2, we will use this again to add onto it based
			-- on how the pattern is
			multiplicand_storage := (multiplicand_storage (30 downto 0) & '0');
			multiplier_storage := multiplier_storage srl 2; -- shifting to the right to remove pattern
			M_bit_pattern := multiplier_storage(2 downto 0); -- grabbing a new pattern
		end loop;
		
		P <= product_storage;
	end process;
end architecture;