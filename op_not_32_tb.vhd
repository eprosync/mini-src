library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- In test benchs we don't have any ports
-- This is because we aren't making a component but rather a simulation
entity op_not_32_tb is 
end entity;

architecture op_not_32_tb_arch of op_not_32_tb is
	-- create our mock signals to shove into the component
	signal A_tb : std_logic_vector(31 downto 0);
	
	-- we will be looking for this signal in modelsim to see if it works
	signal C_tb : std_logic_vector(31 downto 0);
	
	component op_not_32 
		port(
			A: in std_logic_vector(31 downto 0);
			C: out std_logic_vector(31 downto 0)
		);
	end component;
begin
	-- map our mock signals to the component
	DUT1 : op_not_32
		port map (
			A => A_tb,
			C => C_tb
		);
		
	-- this is where the sim will be running it
	sim_process : process
	
	begin
		-- delays are used so that we can see the change in signals
		-- this is espessially useful if your working with timers as well
		-- this is just so we don't have to look for like a 1ns change
		wait for 0ns;
		
		A_tb <= b"00000000000000000000000000011111";
		
		wait for 20ns;
		
		A_tb <= b"11111111111000000000000000000000";
		
		wait for 20ns;
		
		wait;
	end process;
end architecture;