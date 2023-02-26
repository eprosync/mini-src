-- and datapath_tb.vhd file: <This is the filename>
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- entity declaration only; no definition here
ENTITY phase1_tb IS
END ENTITY phase1_tb;

-- Architecture of the testbench with the signal names
ARCHITECTURE phase1_tb_arch OF phase1_tb IS -- Add any other signals to see in your simulation
    SIGNAL clear_tb, clk_tb : std_logic;
    SIGNAL R0in_tb, R1in_tb, R2in_tb, R3in_tb, R4in_tb, R5in_tb, R6in_tb, R7in_tb, R8in_tb, R9in_tb : std_logic;
    SIGNAL R10in_tb, R11in_tb, R12in_tb, R13in_tb, R14in_tb, R15in_tb, Yin_tb, Zin_tb : std_logic;
    SIGNAL PCin_tb, MDRin_tb, INPORTin_tb, Cin_tb, OUTPORTin_tb, HIin_tb, LOin_tb, ZHIin_tb, ZLOin_tb : std_logic;

    SIGNAL R0_out_tb, R1_out_tb, R2_out_tb, R3_out_tb, R4_out_tb, R5_out_tb, R6_out_tb, R7_out_tb : std_logic_vector(31 downto 0)
    SIGNAL R8_out_tb, R9_out_tb, R10_out_tb, R11_out_tb, R12_out_tb, R13_out_tb, R14_out_tb, R15_out_tb : std_logic_vector(31 downto 0);
    SIGNAL BusMuxOut_tb, HI_out_tb, LO_out_tb, IR_out_tb : std_logic_vector(31 downto 0);
    SIGNAL Z_out_tb : std_logic_vector (63 downto 0);

    SIGNAL R0out_tb, R1out_tb, R2out_tb, R3out_tb, R4out_tb, R5out_tb, R6out_tb, R7out_tb, R8out_tb, R9out_tb : std_logic;
    SIGNAL R10out_tb, R11out_tb, R12out_tb, R13out_tb, R14out_tb, R15out_tb : std_logic;
    SIGNAL HIout_tb, LOout_tb, ZLOout_tb, ZHIout_tb, PCout_tb, MDRout_tb, INPORTout_tb, Cout_tb : std_logic;

    SIGNAL Mdatain_tb : std_logic_vector (31 downto 0);
    SIGNAL Read_input_tb : std_logic;
    SIGNAL CS_tb : std_logic_vector(3 downto 0);

    TYPE State IS (default, Reg_load1a, Reg_load1b, Reg_load2a, Reg_load2b, Reg_load3a, Reg_load3b, T0, T1, T2, T3, T4, T5);
    SIGNAL Present_state: State := default;

    -- component instantiation of the datapath
    COMPONENT phase1
    PORT (
        R0_out, R1_out, R2_out, R3_out, R4_out, R5_out, R6_out, R7_out, R8_out, R9_out, R10_out, R11_out, R12_out, R13_out, R14_out, R15_out : out std_logic_vector(31 downto 0);
		BusMuxOut, HI_out, LO_out, IR_out : out std_logic_vector (31 downto 0);
		Z_out : out std_logic_vector (63 downto 0);

        clear, clk : in std_logic;
		Mdatain : in std_logic_vector(31 downto 0);
		CS : in std_logic_vector (3 downto 0);
		Read_input : in std_logic;

        R0out :  in  STD_LOGIC;
		R1out :  in  STD_LOGIC;
		R2out :  in  STD_LOGIC;
		R3out :  in  STD_LOGIC;
		R4out :  in  STD_LOGIC;
		R5out :  in  STD_LOGIC;
		R6out :  in  STD_LOGIC;
		R7out :  in  STD_LOGIC;
		R8out :  in  STD_LOGIC;
		R9out :  in  STD_LOGIC;
		R10out :  in  STD_LOGIC;
		R11out :  in  STD_LOGIC;
		R12out :  in  STD_LOGIC;
		R13out :  in  STD_LOGIC;
		R14out :  in  STD_LOGIC;
		R15out :  in  STD_LOGIC;
		HIout :  in  STD_LOGIC;
		LOout :  in  STD_LOGIC;
		ZLOout :  in  STD_LOGIC;
		ZHIout :  in  STD_LOGIC;
		PCout :  in  STD_LOGIC;
		MDRout :  in  STD_LOGIC;
		INPORTout :  in  STD_LOGIC;
		Cout :  in  STD_LOGIC;

        R0in : in STD_LOGIC;
        R1in :  in  STD_LOGIC;
		R2in :  in  STD_LOGIC;
		R3in :  in  STD_LOGIC;
		R4in :  in  STD_LOGIC;
		R5in :  in  STD_LOGIC;
		R6in :  in  STD_LOGIC;
		R7in :  in  STD_LOGIC;
		R8in :  in  STD_LOGIC;
		R9in :  in  STD_LOGIC;
		R10in :  in  STD_LOGIC;
		R11in :  in  STD_LOGIC;
		R12in :  in  STD_LOGIC;
		R13in :  in  STD_LOGIC;
		R14in :  in  STD_LOGIC;
		R15in :  in  STD_LOGIC;
		ZHIin :  in  STD_LOGIC;
		ZLOin :  in  STD_LOGIC;
		LOin :  in  STD_LOGIC;
		HIin :  in  STD_LOGIC;
		MDRin :  in  STD_LOGIC;
		INPORTin :  in  STD_LOGIC;
		Cin :  in  STD_LOGIC;
		PCin :  in  STD_LOGIC;
		Yin :  in  STD_LOGIC;
		Zin :  in  STD_LOGIC;
		IRin :  in  STD_LOGIC;
		MARin :  in  STD_LOGIC
    );
END COMPONENT phase1;

BEGIN
    DUT : phase1
    --port mapping: between the dut and the testbench signals
    PORT MAP (
        R0_out => R0_out_tb,
		R1_out => R1_out_tb,
		R2_out => R2_out_tb,
		R3_out => R3_out_tb,
		R4_out => R4_out_tb,
		R5_out => R5_out_tb,
		R6_out => R6_out_tb,
		R7_out => R7_out_tb,
		R8_out => R8_out_tb,
		R9_out => R9_out_tb,
		R10_out => R10_out_tb,
		R11_out => R11_out_tb,
		R12_out => R12_out_tb,
		R13_out => R13_out_tb,
		R14_out => R14_out_tb,
		R15_out => R15_out_tb,
		BusMuxOut => BusMuxOut_tb,
		HI_out => HI_out_tb,
		LO_out => LO_out_tb,
		IR_out => IR_out_tb,

		clear => clear_tb,
		clk => clk_tb,

		Mdatain => Mdatain_tb,
		CS => CS_tb,
		Read_input => Read_input_tb,

        R0out => R0out_tb,
		R1out => R1out_tb,
		R2out => R2out_tb,
		R3out => R3out_tb,
		R4out => R4out_tb,
		R5out => R5out_tb,
		R6out => R6out_tb,
		R7out => R7out_tb,
		R8out => R8out_tb,
		R9out => R9out_tb,
		R10out => R10out_tb,
		R11out => R11out_tb,
		R12out => R12out_tb,
		R13out => R13out_tb,
		R14out => R14out_tb,
		R15out => R15out_tb,
		HIout => HIout_tb,
		LOout => LOout_tb,
		ZLOout => Zlowout_tb,
		ZHIout => Zhighout_tb,
		PCout => PCout_tb,
		MDRout => MDRout_tb,
		INPORtout => INPORTout_tb,
		Cout => Cout_tb,

        R0in => R0in_tb,
        R1in => R1in_tb,
        R2in => R2in_tb,
        R3in => R3in_tb,
        R4in => R4in_tb,
        R5in => R5in_tb,
        R6in => R6in_tb,
        R7in => R7in_tb,
        R8in => R8in_tb,
        R9in => R9in_tb,
        R10in => R10in_tb,
        R11in => R11in_tb,
        R12in => R12in_tb,
        R13in => R13in_tb,
        R14in => R14in_tb,
        R15in => R15in_tb,
        ZHIin => ZHIin_tb,
        ZLOin => ZLOin_tb,
        HIin => HIin_tb,
        LOin => LOin_tb,
        MDRin => MDRin_tb,
        INPORTin => INPORTin_tb,
        Cin => Cin_tb,
        PCin => PCin_tb,
        Yin => Yin_tb,
        Zin => Zin_tb,
        IRin => IRin_tb,
        MARin => MARin_tb

    );

    --add test logic here
    Clock_process: PROCESS IS

    BEGIN
        Clock_tb <= '1', '0' after 10 ns;
        Wait for 20 ns;
    END PROCESS Clock_process;

    PROCESS (Clock_tb) IS -- finite state machine

    BEGIN
        IF (rising_edge (Clock_tb)) THEN -- if clock rising-edge
            CASE Present_state IS
                WHEN Default =>
                    Present_state <= Reg_load1a;
                WHEN Reg_load1a =>
                    Present_state <= Reg_load1b;
                WHEN Reg_load1b =>
                	Present_state <= Reg_load2a;
                WHEN Reg_load2a =>
                	Present_state <= Reg_load2b;
                WHEN Reg_load2b =>
                	Present_state <= Reg_load3a;
                WHEN Reg_load3a =>
                	Present_state <= Reg_load3b;
                WHEN Reg_load3b =>
                	Present_state <= T0;
                WHEN T0 =>
                	Present_state <= T1;
                WHEN T1 =>
                	Present_state <= T2;
                WHEN T2 =>
                	Present_state <= T3;
                WHEN T3 =>
                	Present_state <= T4;
                WHEN T4 =>
                	Present_state <= T5;
                WHEN OTHERS =>
            END CASE;
        END IF;
    END PROCESS;

    PROCESS (Present_state) IS -- do the required job in each state

    BEGIN
        CASE Present_state IS -- assert the required signals in each clock cycle
            WHEN Default =>
                R0out_tb <= '0';
                R1out_tb <= '0';
                R2out_tb <= '0';
                R3out_tb <= '0';
                R4out_tb <= '0';
                R5out_tb <= '0';
                R6out_tb <= '0';
                R7out_tb <= '0';
                R8out_tb <= '0';
                R9out_tb <= '0';
                R10out_tb <= '0';
                R11out_tb <= '0';
                R12out_tb <= '0';
                R13out_tb <= '0';
                R14out_tb <= '0';
                R15out_tb <= '0';
                HIout_tb <= '0';
                LOout_tb <= '0';
                Zlowout_tb <= '0';
                Zhighout_tb <= '0';
                PCout_tb <= '0';
                MDRout_tb <= '0';
                INPORTout_tb <= '0';
                Cout_tb <= '0';

                clear_tb <= '0';
                Read_input_tb <= '0';

                R0in
                R1in <= '0';
		        R2in <= '0';
		        R3in <= '0';
		        R4in <= '0';
		        R5in <= '0';
		        R6in <= '0';
		        R7in <= '0';
		        R8in <= '0';
		        R9in <= '0';
		        R10in <= '0';
		        R11in <= '0';
		        R12in <= '0';
		        R13in <= '0';
		        R14in <= '0';
		        R15in <= '0';
	        	ZHIin <= '0';
		        ZLOin <= '0';
		        LOin <= '0';
		        HIin <= '0';
		        MDRin <= '0';
		        INPORTin <= '0';
		        Cin <= '0';
	        	PCin <= '0';
		        Yin <= '0';
		        Zin <= '0';
		        IRin <= '0';
		        MARin <= '0';

            WHEN Reg_load1 =>
                Mdatain_tb <= b"0000_0000_0000_0000_0000_0000_0000_0001";
				Read_input_tb <= '1';
				MDRin_tb <= '1';
				MDRout_tb <= '1';
				R2in_tb <= '1';

            WHEN Reg_load2 =>
                Mdatain_tb <= b"0000_0000_0000_0000_0000_0000_0000_0011" after 10 ns;
                R3in_tb <= '0', '1' after 40 ns;

            WHEN Reg_load3 =>
                R2in_tb <= '0';

            WHEN T0 =>
                R3in_tb <= '0';
                Read_input_tb <= '0';
                MDRout_tb <= '0';
                PCout_tb <= '1';
                MARin_tb <= '1';
                IncPC_tb <= '1';
                Zin_tb <= '1';
                ZHIin_tb <= '1';
                ZLOin_tb <= '1';
            WHEN T1 =>
                ZLOout_tb <= '1';
                PCin_tb <= '1';
                Read_tb <= '1';
                MDRin_tb <= '1';
                Mdatain_tb <= x"294c0000";
            WHEN T2 =>
                MDRout_tb <= '1';
                IRin_tb <= '1';
            WHEN T3 =>
                IRin_tb <= '0';
                MDRout_tb <= '0';
                R2out_tb <= '1';
                Yin_tb <= '1';
            WHEN T4 =>
                R2out_tb <= '0';
                Yin_tb <= '0';
                R3out_tb <= '1';
                CS_tb <= b"0000";
                Zin_tb <= '1';
                ZHIin_tb <= '1';
                ZLOin_tb <= '1';
            WHEN T5 =>
                -- not sure what to write here
            WHEN OTHERS =>
        END CASE;
    END PROCESS;
END ARCHITECTURE datapath_tb_arch;