-- this is our "processor"
-- which manages registers and connections to components like the ALU

library ieee;
use ieee.std_logic_1164.all;
use work.system_components.all;

entity processor is 
	port (
		clk, reset_n, stop, con_ff : in std_logic;
		reset : in std_logic
	);
end entity;

architecture behaviour of processor is
	
begin
	
	process(clk, reset_n) is
	
	begin
	
	end process;
	
end behaviour;