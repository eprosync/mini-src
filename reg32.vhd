-- this is our registers container for 32-bit storage on the processor
-- ex for program counter
-- PC : reg32 port map (clk, reset_n, en, d, q)

library ieee; 
use ieee.std_logic_1164.all; 

entity reg32 is 
	port(
		clk, reset_n, en: in std_logic;
		d: in std_logic_vector(31 downto 0); 
		q: out std_logic_vector(31 downto 0)
	);
end entity;
 
architecture behaviour of reg32 is 

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
