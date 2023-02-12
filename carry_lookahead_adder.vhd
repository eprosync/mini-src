library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_adder is 
	port(
		A: IN std_logic_vector(15 DOWNTO 0); -- Input A
		B: IN std_logic_vector(15 DOWNTO 0); -- Input B
		Cin: IN std_logic; -- Carry in bit
		S: OUT std_logic_vector(15 DOWNTO 0); -- Sum
		Cout: OUT std_logic -- Carry out bit
	);
end carry_lookahead_adder;

architecture behavior of carry_lookahead_adder is 
signal G : std_logic_vector(15 downto 0); -- generate signal
signal P : std_logic_vector(15 downto 0); -- propogate signal
signal C : std_logic_vector(15 downto 0); -- carry signal
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
	
	S <= P xor C;

	-- C16 = G3' + P3'G2' + P3'P2'G1' + P3'P2'P1'G0' + P3'P2'P1'P0'C0 = G0'' + P0''C0 
	Cout <= G(15) or (P(15) and G(14)) or (P(14) and G(13)) or (P(13) and G(12)) or (P(12) and G(11)) or (P(11) and C(11));
end behavior; 