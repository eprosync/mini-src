library ieee;
use ieee.std_logic_1164.all;

entity reg64 is
	port(
		clk, reset_n, en: in std_logic;
		d: in std_logic_vector(64 downto 0);
		q: out std_logic_vector(64 downto 0)
	);
end entity;

architecture behaviour of reg64 is

begin
	process(clk, reset_n)
		begin
		if reset_n = '0' then
			q <= (others => '0');
		elsif clk'event and clk = '1' then
			if en = '1' then
				q <= d;
			end if;
		end if;
	end process;
end architecture;