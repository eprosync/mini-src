-- A simple test bench for the MDMux
-- I made this with comments so that later on we would understand what to do

library ieee;
use ieee.std_logic_1164.all;
use work.system_components.all;

-- In test benchs we don't have any ports
-- This is because we aren't making a component but rather a simulation
entity mdmux_tb is 
end entity;

architecture mdmux_tb_arch of mdmux_tb is
	-- create our mock signals to shove into the component
	signal BusMuxOut_tb : std_logic_vector(31 downto 0);
	signal Mdatain_tb : std_logic_vector(31 downto 0);
	signal ReadCmd_tb : std_logic;
	
	-- we will be looking for this signal in modelsim to see if it works
	signal D_tb : std_logic_vector(31 downto 0);
begin
	-- map our mock signals to the component
	DUT1 : MDMux
		port map (
			BusMuxOut => BusMuxOut_tb,
			Mdatain => Mdatain_tb,
			ReadCmd => ReadCmd_tb,
			D => D_tb
		)
		
	-- this is where the sim will be running it
	sim_process : process
	
	begin
		-- delays are used so that we can see the change in signals
		-- this is espessially useful if your working with timers as well
		-- this is just so we don't have to look for like a 1ns change
		wait for 0ns;
		
		BusMuxOut_tb <= b"00000000000000000000000000000000";
		Mdatain_tb <= b"11111111111111111111111111111111";
		ReadCmd_tb <= '1';
		-- ^ D should be BusMuxOut_tb
		
		wait for 20ns;
		
		BusMuxOut_tb <= b"00000000000000000000000000000000";
		Mdatain_tb <= b"11111111111111111111111111111111";
		ReadCmd_tb <= '0';
		-- ^ D should be Mdatain_tb
		
		wait;
	end process;
end architecture;