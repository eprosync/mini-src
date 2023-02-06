-- A simple test bench for the BusMux
-- I made this with comments so that later on we would understand what to do

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- In test benchs we don't have any ports
-- This is because we aren't making a component but rather a simulation
entity BusMux_tb is 
end entity;

architecture BusMux_tb_arch of BusMux_tb is
	-- create our mock signals to shove into the component
	signal R0_tb : std_logic_vector(31 downto 0);
	signal R1_tb : std_logic_vector(31 downto 0);
	signal R2_tb : std_logic_vector(31 downto 0);
	signal R3_tb : std_logic_vector(31 downto 0);
	signal R4_tb : std_logic_vector(31 downto 0);
	signal R5_tb : std_logic_vector(31 downto 0);
	signal R6_tb : std_logic_vector(31 downto 0);
	signal R7_tb : std_logic_vector(31 downto 0);
	signal R8_tb : std_logic_vector(31 downto 0);
	signal R9_tb : std_logic_vector(31 downto 0);
	signal R10_tb : std_logic_vector(31 downto 0);
	signal R11_tb : std_logic_vector(31 downto 0);
	signal R12_tb : std_logic_vector(31 downto 0);
	signal R13_tb : std_logic_vector(31 downto 0);
	signal R14_tb : std_logic_vector(31 downto 0);
	signal R15_tb : std_logic_vector(31 downto 0);
	
	signal HI_tb : std_logic_vector(31 downto 0);
	signal LO_tb : std_logic_vector(31 downto 0);
	
	signal ZHI_tb : std_logic_vector(31 downto 0);
	signal ZLO_tb : std_logic_vector(31 downto 0);
	
	signal PC_tb : std_logic_vector(31 downto 0);
	signal MDR_tb : std_logic_vector(31 downto 0);
	signal INPORT_tb : std_logic_vector(31 downto 0);
	signal C_tb : std_logic_vector(31 downto 0);
	
	signal S_tb : std_logic_vector(4 downto 0);
	
	-- we should be looking for this in modelsim
	signal BusMuxOut_tb : std_logic_vector (31 downto 0);
	
	component BusMux
		port (
			R0,
			R1,
			R2,
			R3,
			R4,
			R5,
			R6,
			R7,
			R8,
			R9,
			R10,
			R11,
			R12,
			R13,
			R14,
			R15,
			HI,
			LO,
			ZHI,
			ZLO,
			PC,
			MDR,
			INPORT,
			C
			: in std_logic_vector (31 downto 0);
		
			S : in std_logic_vector (4 downto 0);
			BusMuxOut : out std_logic_vector (31 downto 0)
		);
	end component;
begin
	-- map our mock signals to the component
	DUT1 : BusMux
		port map (
			R0 => R0_tb,
			R1 => R1_tb,
			R2 => R2_tb,
			R3 => R3_tb,
			R4 => R4_tb,
			R5 => R5_tb,
			R6 => R6_tb,
			R7 => R7_tb,
			R8 => R8_tb,
			R9 => R9_tb,
			R10 => R10_tb,
			R11 => R11_tb,
			R12 => R12_tb,
			R13 => R13_tb,
			R14 => R14_tb,
			R15 => R15_tb,
			
			HI => HI_tb,
			LO => LO_tb,
			
			ZHI => ZHI_tb,
			ZLO => ZLO_tb,
			
			PC => PC_tb,
			MDR => MDR_tb,
			INPORT => INPORT_tb,
			C => C_tb,
			
			S => S_tb,
			
			BusMuxOut => BusMuxOut_tb
		);
		
	-- this is where the sim will be running it
	sim_process : process
	
	begin
		-- delays are used so that we can see the change in signals
		-- this is espessially useful if your working with timers as well
		-- this is just so we don't have to look for like a 1ns change
		wait for 0ns;
		
		R0_tb <= b"00000000000000000000000000111000";
		R1_tb <= b"00000000000000000000000000000111";
		PC_tb <= b"00000000000000000000000000000001";
		S_tb <= b"00001";
		
		wait for 20ns;
		
		R0_tb <= b"00000000000000000000000000111000";
		R1_tb <= b"00000000000000000000000000000111";
		PC_tb <= b"00000000000000000000000000000001";
		S_tb <= b"00010";
		
		wait for 20ns;
		
		R0_tb <= b"00000000000000000000000000111000";
		R1_tb <= b"00000000000000000000000000000111";
		PC_tb <= b"00000000000000000000000000000001";
		S_tb <= b"10101";
		
		wait;
	end process;
end architecture;