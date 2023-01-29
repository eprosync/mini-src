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
end package;