library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_select_encoder is
    port (
        Gra, Grb, Grc, Rin, Rout, BAout : in std_logic;
        IR : in std_logic_vector(31 downto 0);
        C_sign_extended : out std_logic_vector(31 downto 0);
        Regin, Regout : out std_logic_vector(15 downto 0)
    );
end entity;

architecture behavior of reg_select_encoder is
begin
	process(Gra, Grb, Grc, Rin, Rout, BAout, IR)
		variable RA, RB, RC : std_logic_vector(3 downto 0);
		variable R_decoder : std_logic_vector(3 downto 0);
		variable R_selector, Rin_selector, Rout_selector, BAout_selector : std_logic_vector(15 downto 0);
	begin
		-- And gate for RA & Gra
		RA := IR(26 downto 23);
		if (Gra /= '1') then
			RA := b"0000";
		end if;
		
		-- And gate for RB & Grb
		RB := IR(22 downto 19);
		if (Grb /= '1') then
			RB := b"0000";
		end if;
		
		-- And gate for RC & Grc
		RC := IR(18 downto 15);
		if (Grc /= '1') then
			RC := b"0000";
		end if;
		
		-- 4 to 16 decoder for selecting the right register
		R_decoder := RA or RB or RC;
		case R_decoder is
			when "0000" => R_selector := b"0000_0000_0000_0001";
			when "0001" => R_selector := b"0000_0000_0000_0010";
			when "0010" => R_selector := b"0000_0000_0000_0100";
			when "0011" => R_selector := b"0000_0000_0000_1000";
			when "0100" => R_selector := b"0000_0000_0001_0000";
			when "0101" => R_selector := b"0000_0000_0010_0000";
			when "0110" => R_selector := b"0000_0000_0100_0000";
			when "0111" => R_selector := b"0000_0000_1000_0000";
			when "1000" => R_selector := b"0000_0001_0000_0000";
			when "1001" => R_selector := b"0000_0010_0000_0000";
			when "1010" => R_selector := b"0000_0100_0000_0000";
			when "1011" => R_selector := b"0000_1000_0000_0000";
			when "1100" => R_selector := b"0001_0000_0000_0000";
			when "1101" => R_selector := b"0010_0000_0000_0000";
			when "1110" => R_selector := b"0100_0000_0000_0000";
			when "1111" => R_selector := b"1000_0000_0000_0000";
			when others => R_selector := b"0000_0000_0000_0000";
		end case;
		
		-- Rin
		if (Rin = '1') then
			Rin_selector := x"1111";
		end if;
		
		-- Rout
		if (Rout = '1') then
			Rout_selector := x"1111";
		end if;
		
		-- BAout
		if (BAout = '1') then
			BAout_selector := x"1111";
		end if;
		
		-- the little and gates at the end after decoder
		Regin <= R_selector and Rin_selector;
		Regout <= R_selector and (Rout_selector or BAout_selector);
		
		if (IR(18) = '0') then -- this checks for 2's compliments
			C_sign_extended(31 downto 19) <= b"0000_0000_0000_0";
		else
			C_sign_extended(31 downto 19) <= b"1111_1111_1111_1";
		end if;
		
		-- add the immediate to the C_sign_extended
		C_sign_extended(18 downto 0) <= IR(18 downto 0);
	end process;
end architecture;