library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- In test benchs we don't have any ports
-- This is because we aren't making a component but rather a simulation
entity booth_32_bitPair_tb is 
end entity;

architecture booth_32_bitPair_tb_arch of booth_32_bitPair_tb is
	-- create our mock signals to shove into the component
	signal M_tb : signed(31 downto 0);
	signal Q_tb : signed(31 downto 0);
	
	-- we will be looking for this signal in modelsim to see if it works
	signal P_tb : signed(63 downto 0);
	
	component booth_32_bitPair 
		port(
			M: in signed(31 DOWNTO 0); -- Multiplicand
			Q: in signed(31 DOWNTO 0); -- Multiplier
			P: out signed(63 DOWNTO 0)
		);
	end component;
begin
	-- map our mock signals to the component
	DUT1 : booth_32_bitPair
		port map (
			M => M_tb,
			Q => Q_tb,
			P => P_tb
		);
		
	-- this is where the sim will be running it
	sim_process : process
	
	begin
		-- delays are used so that we can see the change in signals
		-- this is espessially useful if your working with timers as well
		-- this is just so we don't have to look for like a 1ns change
		wait for 0ns;
		
		M_tb <= b"00000000000000000000000000000010";
		Q_tb <= b"00000000000000000000000000000010";
		
		wait for 20ns;
		
		M_tb <= b"00000000000000000000000000000100";
		Q_tb <= b"00000000000000000000000000000010";
		
		wait for 20ns;
		
		M_tb <= b"00000000000000010000000000000000";
		Q_tb <= b"00000000000000000000000000000010";
		
		wait;
	end process;
end architecture;