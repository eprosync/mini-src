// !!!!! Remind me to wire these back up later on, connections should be internal !!!!!
module phase1(
        // This should connect to some sort of quartz clock or something
        input Clock, Clear,

        // Program Counter & Instructions
        input PCin, PCout, IncrementPC, IRin,
        output wire [31:0] PC_data_out,

        // Enablers, for turning on things like registers
        input Gra, Grb, Grc, Rin, Rout, BAout,
        input HIin, LOin, Cin,

        // Outputers, for controlling the big boy BusMux, which will change the big boy datapath
        input HIout, LOout, INPORTout, Cout,
        output wire [31:0] HI_data_out, LO_data_out, INPORT_data_out, C_data_out,

        // ALU, for making the ALU do stuff and other things
        input Yin, Zin, ZHIout, ZLOout,
		output wire [31:0] Y_data_out,
        output wire [63:0] Z_data_out,

        // Memory Management, so that we can shove data in
        input MDRin, MARin, MDRout, Read, Write
        input [31:0] Mdatain,
		output wire [31:0] MDR_data_in, MDR_data_out, MAR_data_out,

        // For debugging (also for TA to mark!)
        output wire [31:0] R0_data_out, R1_data_out, R2_data_out, R3_data_out, R4_data_out, R5_data_out, R6_data_out, R7_data_out, R8_data_out, R9_data_out, R10_data_out, R11_data_out, R12_data_out, R13_data_out, R14_data_out, R15_data_out,
        output wire [31:0] ZHI_data_out, ZLO_data_out, IR_data_out, big_boy_bus,
        output wire [15:0] Rin_cs, Rout_cs
    );

    increment_pc_32 PC(big_boy_bus, Clock, IncrementPC, PCin, PC_data_out);
    register_32 IR(big_boy_bus, Clock, Clear, IRin, IR_data_out);
    select_encoder select_encoder (Gra, Grb, Grc, Rin, Rout, BAout, IR_data_out, big_boy_bus, Rin_cs, Rout_cs);

    // Le big boy bus!
    // This guy is responsible for communication between registers, alu, cpu, etc
    // wire [31:0] big_boy_bus;

    // This is for registers
    register_R0_32 R0(big_boy_bus, Clock, Clear, Rin_cs[0], BAout, R0_data_out); // you don't have to specify if you put it in the orrect order!
    register_32 R1(big_boy_bus, Clock, Clear, Rin_cs[1], R1_data_out);
    register_32 R2(big_boy_bus, Clock, Clear, Rin_cs[2], R2_data_out);
    register_32 R3(big_boy_bus, Clock, Clear, Rin_cs[3], R3_data_out);
    register_32 R4(big_boy_bus, Clock, Clear, Rin_cs[4], R4_data_out);
    register_32 R5(big_boy_bus, Clock, Clear, Rin_cs[5], R5_data_out);
    register_32 R6(big_boy_bus, Clock, Clear, Rin_cs[6], R6_data_out);
    register_32 R7(big_boy_bus, Clock, Clear, Rin_cs[7], R7_data_out);
    register_32 R8(big_boy_bus, Clock, Clear, Rin_cs[8], R8_data_out);
    register_32 R9(big_boy_bus, Clock, Clear, Rin_cs[9], R9_data_out);
    register_32 R10(big_boy_bus, Clock, Clear, Rin_cs[10], R10_data_out);
    register_32 R11(big_boy_bus, Clock, Clear, RRin_cs[11]11in, R11_data_out);
    register_32 R12(big_boy_bus, Clock, Clear, Rin_cs[12], R12_data_out);
    register_32 R13(big_boy_bus, Clock, Clear, Rin_cs[13], R13_data_out);
    register_32 R14(big_boy_bus, Clock, Clear, Rin_cs[14], R14_data_out);
    register_32 R15(big_boy_bus, Clock, Clear, Rin_cs[15], R15_data_out);

    // This is for special register
    register_32 HI(big_boy_bus, Clock, Clear, HIin, HI_data_out);
    register_32 LO(big_boy_bus, Clock, Clear, LOin, LO_data_out);
    register_32 INPORT(big_boy_bus, Clock, Clear, INPORTin, INPORT_data_out);
	 //  ^ Uppercase Gaming!!!
    
    // The "Teacher! LuK! I kan du 1 pwas 1!!! It equel tu!" Sector
    register_32 ZHI(Z_data_out[63:32], Clock, Clear, Zin, ZHI_data_out);
    register_32 ZLO(Z_data_out[31:0], Clock, Clear, Zin, ZLO_data_out);
    register_32 Y(big_boy_bus, Clock, Clear, Yin, Y_data_out);
    ALU ALU(Clock, Clear, IR[31:27], Y_data_out, big_boy_bus, Z_data_out);

    // The "I Forget" Sector, you know, memory n stuff, why do I even bother...
    register_32 MDR(MDR_data_in, Clock, Clear, MDRin, MDR_data_out);
    register_32 MAR(big_boy_bus, Clock, Clear, MARin, MAR_data_out);
    MDMux MDMux (big_boy_bus, Mdatain, Read, MDR_data_in);
    RAM RAM (Read, Write, big_boy_bus, MAR_data_out[8:0]);

    // The "Stfu datapath use this register" Sector
    wire [4:0] busmux_encoder_selector;
    BusMuxEncoder BusMuxEncoder(
        .R0(Rout_cs[0]),
        .R1(Rout_cs[1]),
        .R2(Rout_cs[2]),
        .R3(Rout_cs[3]),
        .R4(Rout_cs[4]),
        .R5(Rout_cs[5]),
        .R6(Rout_cs[6]),
        .R7(Rout_cs[7]),
        .R8(Rout_cs[8]),
        .R9(Rout_cs[9]),
        .R10(Rout_cs[10]),
        .R11(Rout_cs[11]),
        .R12(Rout_cs[12]),
        .R13(Rout_cs[13]),
        .R14(Rout_cs[14]),
        .R15(Rout_cs[15]),

        .HI(HIout),
        .LO(LOout),
        .ZHI(ZHIout),
        .ZLO(ZLOout),
        .PC(PCout),
        .MDR(MDRout),
        .InPort(INPORTout),
        .C(Cout),

        .Control(busmux_encoder_selector)
    );

    BusMux BusMux (
        .R0(R0_data_out),
        .R1(R1_data_out),
        .R2(R2_data_out),
        .R3(R3_data_out),
        .R4(R4_data_out),
        .R5(R5_data_out),
        .R6(R6_data_out),
        .R7(R7_data_out),
        .R8(R8_data_out),
        .R9(R9_data_out),
        .R10(R10_data_out),
        .R11(R11_data_out),
        .R12(R12_data_out),
        .R13(R13_data_out),
        .R14(R14_data_out),
        .R15(R15_data_out),

        .HI(HI_data_out),
        .LO(LO_data_out),
        .ZHI(ZHI_data_out),
        .ZLO(ZLO_data_out),
        .PC(PC_data_out),
        .MDR(MDR_data_out),
        .InPort(INPORT_data_out),
        .C(C_data_out),

        .Control(busmux_encoder_selector),
        .BusMuxOut(big_boy_bus)
    );

endmodule