-- A simple test bench for the ALU
-- I made this with comments so that later on we would understand what to do

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- In test benchs we don't have any ports
-- This is because we aren't making a component but rather a simulation
entity alu_tb is 
end entity;

architecture alu_tb_arch of alu_tb is
	-- create our mock signals to shove into the component
	signal A_tb : std_logic_vector(31 downto 0);
	signal B_tb : std_logic_vector(31 downto 0);
	signal CS_tb : std_logic_vector(3 downto 0);
	
	-- we will be looking for this signal in modelsim to see if it works
	signal C_tb : std_logic_vector(63 downto 0);
	
	component alu
		port (
			A,B : in std_logic_vector (31 downto 0);
			CS : in std_logic_vector (3 downto 0);
			C : out std_logic_vector (63 downto 0)
		);
	end component;
begin
	-- map our mock signals to the component
	DUT1 : alu
		port map (
			A => A_tb,
			B => B_tb,
			CS => CS_tb,
			C => C_tb
		);
		
	-- this is where the sim will be running it
	sim_process : process
	
	begin
		-- delays are used so that we can see the change in signals
		-- this is espessially useful if your working with timers as well
		-- this is just so we don't have to look for like a 1ns change
		wait for 0ns;
		
		-- addition
		A_tb <= b"00000000000000000000000000001001";
		B_tb <= b"00000000000000000000000000001001";
		CS_tb <= b"0000";
		
		wait for 20ns;
		
		-- subtraction
		A_tb <= b"00000000000000000000000000001001";
		B_tb <= b"00000000000000000000000000001001";
		CS_tb <= b"0001";
		
		wait for 20ns;
		
		-- multiply
		A_tb <= b"00000000000000000000000000000100";
		B_tb <= b"00000000000000000000000000000010";
		CS_tb <= b"0010";
		
		wait for 20ns;
		
		-- divide
		A_tb <= b"00000000000000000000000000001000";
		B_tb <= b"00000000000000000000000000000010";
		CS_tb <= b"0011";
		
		wait for 20ns;
		
		-- and
		A_tb <= b"00000000000000000000000001111111";
		B_tb <= b"00000000000000000000000000011100";
		CS_tb <= b"0100";
		
		wait for 20ns;
		
		-- or
		A_tb <= b"00000000000000000000000000001111";
		B_tb <= b"00000000000000000000000000111100";
		CS_tb <= b"0101";
		
		wait for 20ns;
		
		-- shr
		A_tb <= b"00000000000000000000000000001100";
		B_tb <= b"00000000000000000000000000000010";
		CS_tb <= b"0110";
		
		wait for 20ns;
		
		-- shl
		A_tb <= b"00000000000000000000000000000011";
		B_tb <= b"00000000000000000000000000000010";
		CS_tb <= b"0111";
		
		wait for 20ns;
		
		-- not
		A_tb <= b"00000000000000000000000001111111";
		B_tb <= b"00000000000000000000000000000000";
		CS_tb <= b"1010";
		
		wait for 20ns;
		
		-- negate
		A_tb <= b"00000000000000000000000001010101";
		B_tb <= b"00000000000000000000000000000000";
		CS_tb <= b"1011";
		
		wait for 20ns;
		
		wait;
	end process;
end architecture;