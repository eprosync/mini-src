-- here is our components mapping
-- this allows us to easily fetch and use the components we build

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package system_components is
	-- ALU
	component ALU
		port (
			A,B : in signed (31 downto 0);
			CS : in std_logic_vector (3 downto 0);
			C : out signed (63 downto 0)
		);
	end component;
	
	-- reg32
	component reg32
		port (
			clk, reset_n, en: in std_logic;
			d: in std_logic_vector(31 downto 0); 
			q: out std_logic_vector(31 downto 0)
		);
	end component;
	
	-- encoder32to5
	component encoder32to5
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
			C: in std_logic;
			
			S : out std_logic_vector (4 downto 0)
		);
	end component;
	
	component busmux
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
	
	component MDMux
		port (
			BusMuxOut, Mdatain : in std_logic_vector (31 downto 0);
			ReadCmd : in std_logic;
			D : out std_logic_vector (31 downto 0)
		);
	end component;
end package;