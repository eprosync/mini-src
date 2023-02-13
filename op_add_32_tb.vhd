library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- In test benchs we don't have any ports
-- This is because we aren't making a component but rather a simulation
entity op_add_32_tb is 
end entity;

architecture op_add_32_tb_arch of op_add_32_tb is
	-- create our mock signals to shove into the component
	signal A_tb : std_logic_vector(31 downto 0);
	signal B_tb : std_logic_vector(31 downto 0);
	signal Cin_tb : std_logic;
	
	-- we will be looking for this signal in modelsim to see if it works
	signal S_tb : std_logic_vector(31 downto 0);
	signal Cout_tb : std_logic;
	
	component op_add_32
		port(
			A: IN std_logic_vector(31 DOWNTO 0); -- Input A
			B: IN std_logic_vector(31 DOWNTO 0); -- Input B
			Cin: IN std_logic; -- Carry in bit
			S: OUT std_logic_vector(31 DOWNTO 0); -- Sum
			Cout: OUT std_logic -- Carry out bit
		);
	end component;
begin
	-- map our mock signals to the component
	DUT1 : op_add_32
		port map (
			A => A_tb,
			B => B_tb,
			Cin => Cin_tb,
			S => S_tb,
			Cout => Cout_tb
		);
		
	-- this is where the sim will be running it
	sim_process : process
	
	begin
		-- delays are used so that we can see the change in signals
		-- this is espessially useful if your working with timers as well
		-- this is just so we don't have to look for like a 1ns change
		wait for 0ns;
		
		A_tb <= b"00000000000000000000000000000011";
		B_tb <= b"00000000000000000000000000000010";
		Cin_tb <= '0';
		
		wait for 20ns;
		
		A_tb <= b"01010000000000000000000000000000";
		B_tb <= b"01010000000000000000000000000000";
		Cin_tb <= '0';
		
		wait for 20ns;
		
		A_tb <= b"01010000000000000000000000000000";
		B_tb <= b"01010000000000000000000000000000";
		Cin_tb <= '1';
		
		wait;
	end process;
end architecture;