library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_adder_32 is 
	port(
		A: IN std_logic_vector(31 DOWNTO 0); -- Input A
		B: IN std_logic_vector(31 DOWNTO 0); -- Input B
		Cin: IN std_logic; -- Carry in bit
		S: OUT std_logic_vector(31 DOWNTO 0); -- Sum
		Cout: OUT std_logic -- Carry out bit
	);
end carry_lookahead_adder_32;

architecture behavior of carry_lookahead_adder_32 is 
signal G : std_logic_vector(31 downto 0); -- generate signal
signal P : std_logic_vector(31 downto 0); -- propogate signal
signal C : std_logic_vector(31 downto 0); -- carry signal
begin
	G <= A and B;
	P <= A xor B;

	-- 4-bit adder part 1
	C(0) <= Cin;
	C(1) <= G(0) or (P(0) and Cin);
	C(2) <= G(1) or (P(1) and G(0)) or (P(0) and Cin);
	C(3) <= G(2) or (P(2) and G(1)) or (P(1) and G(0)) or (P(0) and Cin);
	
	-- 4-bit adder part 2
	C(4) <= G(3) or (P(3) and C(3)); -- G0 + P0C0
	C(5) <= G(4) or (P(4) and G(3)) or (P(3) and C(3)); -- G1 + P1C1 = G1 + P1G0 + P1P0G0
	C(6) <= G(2) or (P(5) and G(4)) or (P(4) and G(3)) or (P(3) and C(3));
	C(7) <= G(6) or (P(6) and G(5)) or (P(5) and G(4)) or (P(4) and G(3)) or (P(3) and C(3));
	
	-- 4-bit adder part 3
	C(8) <= G(7) or (P(7) and C(7)); -- G0 + P0C0
	C(9) <= G(8) or (P(8) and G(7)) or (P(7) and C(7)); -- G1 + P1C1 = G1 + P1G0 + P1P0G0
	C(10) <= G(9) or (P(9) and G(8)) or (P(8) and G(7)) or (P(7) and C(7));
	C(11) <= G(10) or (P(10) and G(9)) or (P(9) and G(8)) or (P(8) and G(7)) or (P(7) and C(7));
	
	-- 4-bit adder part 4
	C(12) <= G(11) or (P(11) and C(11)); -- G0 + P0C0
	C(13) <= G(12) or (P(12) and G(11)) or (P(11) and C(11)); -- G1 + P1C1 = G1 + P1G0 + P1P0G0
	C(14) <= G(13) or (P(13) and G(12)) or (P(12) and G(11)) or (P(11) and C(11));
	C(15) <= G(14) or (P(14) and G(13)) or (P(13) and G(12)) or (P(12) and G(11)) or (P(11) and C(11));

	-- 4-bit adder part 5
	C(16) <= G(15) or (P(15) and C(15)); -- G0 + P0C0
	C(17) <= G(16) or (P(16) and G(15)) or (P(15) and C(15)); -- G1 + P1C1 = G1 + P1G0 + P1P0G0
	C(18) <= G(17) or (P(17) and G(16)) or (P(16) and G(15)) or (P(15) and C(15));
	C(19) <= G(18) or (P(18) and G(17)) or (P(17) and G(16)) or (P(16) and G(15)) or (P(15) and C(15));
	
	-- 4-bit adder part 6
	C(20) <= G(19) or (P(19) and C(19)); -- G0 + P0C0
	C(21) <= G(20) or (P(20) and G(19)) or (P(19) and C(19)); -- G1 + P1C1 = G1 + P1G0 + P1P0G0
	C(22) <= G(21) or (P(21) and G(20)) or (P(20) and G(19)) or (P(19) and C(19));
	C(23) <= G(22) or (P(22) and G(21)) or (P(21) and G(20)) or (P(20) and G(19)) or (P(19) and C(19));
	
	-- 4-bit adder part 7
	C(24) <= G(23) or (P(23) and C(23)); -- G0 + P0C0
	C(25) <= G(24) or (P(24) and G(23)) or (P(23) and C(23)); -- G1 + P1C1 = G1 + P1G0 + P1P0G0
	C(26) <= G(25) or (P(25) and G(24)) or (P(24) and G(23)) or (P(23) and C(23));
	C(27) <= G(26) or (P(26) and G(25)) or (P(25) and G(24)) or (P(24) and G(23)) or (P(23) and C(23));
	
	-- 4-bit adder part 8
	C(28) <= G(27) or (P(27) and C(27)); -- G0 + P0C0
	C(29) <= G(28) or (P(28) and G(27)) or (P(27) and C(27)); -- G1 + P1C1 = G1 + P1G0 + P1P0G0
	C(30) <= G(29) or (P(29) and G(28)) or (P(28) and G(27)) or (P(27) and C(27));
	C(31) <= G(30) or (P(30) and G(29)) or (P(29) and G(28)) or (P(28) and G(27)) or (P(27) and C(27));

	S <= P xor C;
	
	-- C16 = G3' + P3'G2' + P3'P2'G1' + P3'P2'P1'G0' + P3'P2'P1'P0'C0 = G0'' + P0''C0 
	Cout <= G(31) or (P(31) and G(30)) or (P(30) and G(29)) or (P(29) and G(26)) or (P(26) and G(25)) or (P(25) and C(25));
end behavior; 