library ieee;
use ieee.std_logic_1164.all;
use work.system_components.all;

entity phase1 is
	port (
		clk :  IN  STD_LOGIC;
		reset_n :  IN  STD_LOGIC;
		en_R0 :  IN  STD_LOGIC;
		en_R1 :  IN  STD_LOGIC;
		en_R2 :  IN  STD_LOGIC;
		en_R3 :  IN  STD_LOGIC;
		en_R4 :  IN  STD_LOGIC;
		en_R5 :  IN  STD_LOGIC;
		en_R6 :  IN  STD_LOGIC;
		en_R7 :  IN  STD_LOGIC;
		en_R8 :  IN  STD_LOGIC;
		en_R9 :  IN  STD_LOGIC;
		en_R10 :  IN  STD_LOGIC;
		en_R11 :  IN  STD_LOGIC;
		en_R12 :  IN  STD_LOGIC;
		en_R13 :  IN  STD_LOGIC;
		en_R14 :  IN  STD_LOGIC;
		en_R15 :  IN  STD_LOGIC;
		en_INPORT :  IN  STD_LOGIC;
		en_MDR :  IN  STD_LOGIC;
		en_C :  IN  STD_LOGIC;
		en_PC :  IN  STD_LOGIC;
		en_ZHI :  IN  STD_LOGIC;
		en_ZLO :  IN  STD_LOGIC;
		en_LO :  IN  STD_LOGIC;
		en_HI :  IN  STD_LOGIC;
		en_Y :  IN  STD_LOGIC;
		en_Z :  IN  STD_LOGIC;
		en_IR :  IN  STD_LOGIC;
		en_MAR :  IN  STD_LOGIC;
		C_in : STD_LOGIC_VECTOR(31 DOWNTO 0);
		Inport_in : STD_LOGIC_VECTOR(31 DOWNTO 0);
		R0_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R1_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R2_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R3_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R4_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R5_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R6_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R7_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R8_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R9_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R10_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R11_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R12_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R13_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R14_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		R15_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALU_out :  INOUT  STD_LOGIC_VECTOR(63 DOWNTO 0);
		BusMuxOut :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		C_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		HI_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		INPORT_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		IR_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		LO_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		MAR_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		MDR_in :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		MDR_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		PC_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Y_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Z_in :  INOUT  STD_LOGIC_VECTOR(63 DOWNTO 0);
		ZHI_in :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ZHI_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ZLO_in :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ZLO_out :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end phase1;

architecture arch_phase1 of phase1 is

component reg32
	port (
		clk, reset_n, en: in std_logic;
		d: in std_logic_vector(31 downto 0);
		q: out std_logic_vector(31 downto 0)
	);
end component;

begin

C: reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_C,
	d => C_in,
	q => C_out
);

HI : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_HI,
	d => BusMuxOut,
	q => HI_out
);

INPORT: reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_INPORT,
	d => INPORT_in,
	q => INPORT_out
);

IR: reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_IR,
	d => BusMuxOut,
	q => IR_out
);

LO: reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_LO,
	d => BusMuxOut,
	q => LO_out
);

MAR : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_MAR,
	d => BusMuxOut,
	q => MAR_out
);

MDR: reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_MAR,
	d => MDR_in,
	q => MDR_out
);

PC: reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_PC,
	d => BusMuxOut,
	q => PC_out
);


R0 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R0,
	d => BusMuxOut,
	q => R0_out
);

R1 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R1,
	d => BusMuxOut,
	q => R1_out
);

R2 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R2,
	d => BusMuxOut,
	q => R2_out
);

R3 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R3,
	d => BusMuxOut,
	q => R3_out
);

R4 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R4,
	d => BusMuxOut,
	q => R4_out
);

R5 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R5,
	d => BusMuxOut,
	q => R5_out
);

R6 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R6,
	d => BusMuxOut,
	q => R6_out
);

R7 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R7,
	d => BusMuxOut,
	q => R7_out
);

R8 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R8,
	d => BusMuxOut,
	q => R8_out
);

R9 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R9,
	d => BusMuxOut,
	q => R9_out
);

R10 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R10,
	d => BusMuxOut,
	q => R10_out
);

R11 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R11,
	d => BusMuxOut,
	q => R11_out
);

R12 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R12,
	d => BusMuxOut,
	q => R12_out
);

R13 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R13,
	d => BusMuxOut,
	q => R13_out
);

R14 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R14,
	d => BusMuxOut,
	q => R14_out
);

R15 : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_R4,
	d => BusMuxOut,
	q => R15_out
);

Y : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_Y,
	d => ZHI_in,
	q => Y_out
);

Z : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_Z,
	d => ALU_out,
	q => Z_out
);

ZHI : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_ZHI,
	d => ZHI_in,
	q => ZLO_out
);

ZLO : reg32
PORT MAP(
	reset_n => reset_n,
	clk => clk,
	en => en_ZLO,
	d => ZLO_in,
	q => ZLO_out
);

end arch_phase1;