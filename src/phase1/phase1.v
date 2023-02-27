// !!!!! Remind me to wire these back up later on, connections should be internal !!!!!
module phase1(
        // This should connect to some sort of quartz clock or something
        input Clock, Clear,

        // Program Counter & Instructions
        input PCin, PCout, IncrementPC, IRin,
        output wire [31:0] PC_data_out,


        // Enablers, for turning on things like registers
        input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
        input HIin, LOin, Cin,

        // Outputers, for controlling the big boy BusMux, which will change the big boy datapath
        input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
        input HIout, LOout, INPORTout, Cout,
        output wire [31:0] HI_data_out, LO_data_out, INPORT_data_out, C_data_out,

        // ALU, for making the ALU do stuff and other things
        input Yin, Zin, ZHIout, ZLOout,
        input [4:0] ALUControl,
		  output wire [31:0] Y_data_out,
        output wire [63:0] Z_data_out,

        // Memory Management, so that we can shove data in
        input MDRin, MARin, MDRout, Read,
        input [31:0] Mdatain,
		  output wire [31:0] MDR_data_in, MDR_data_out, MAR_data_out,

        // For debugging (also for TA to mark!)
        output wire [31:0] R0_data_out, R1_data_out, R2_data_out, R3_data_out, R4_data_out, R5_data_out, R6_data_out, R7_data_out, R8_data_out, R9_data_out, R10_data_out, R11_data_out, R12_data_out, R13_data_out, R14_data_out, R15_data_out,
        output wire [31:0] ZHI_data_out, ZLO_data_out, IR_data_out, big_boy_bus
    );

    // Le big boy bus!
    // This guy is responsible for communication between registers, alu, cpu, etc
    // wire [31:0] big_boy_bus;

    // This is for registers
    register_32 R0(big_boy_bus, Clock, Clear, R0in, R0_data_out); // you don't have to specify if you put it in the orrect order!
    register_32 R1(big_boy_bus, Clock, Clear, R1in, R1_data_out);
    register_32 R2(big_boy_bus, Clock, Clear, R2in, R2_data_out);
    register_32 R3(big_boy_bus, Clock, Clear, R3in, R3_data_out);
    register_32 R4(big_boy_bus, Clock, Clear, R4in, R4_data_out);
    register_32 R5(big_boy_bus, Clock, Clear, R5in, R5_data_out);
    register_32 R6(big_boy_bus, Clock, Clear, R6in, R6_data_out);
    register_32 R7(big_boy_bus, Clock, Clear, R7in, R7_data_out);
    register_32 R8(big_boy_bus, Clock, Clear, R8in, R8_data_out);
    register_32 R9(big_boy_bus, Clock, Clear, R9in, R9_data_out);
    register_32 R10(big_boy_bus, Clock, Clear, R10in, R10_data_out);
    register_32 R11(big_boy_bus, Clock, Clear, R11in, R11_data_out);
    register_32 R12(big_boy_bus, Clock, Clear, R12in, R12_data_out);
    register_32 R13(big_boy_bus, Clock, Clear, R13in, R13_data_out);
    register_32 R14(big_boy_bus, Clock, Clear, R14in, R14_data_out);
    register_32 R15(big_boy_bus, Clock, Clear, R15in, R15_data_out);

    // This is for special register
    // IR isn't used yet!
    increment_pc_32 PC(big_boy_bus, Clock, IncrementPC, PCin, PC_data_out);
    register_32 IR(big_boy_bus, Clock, Clear, IRin, IR_data_out);
    register_32 HI(big_boy_bus, Clock, Clear, HIin, HI_data_out);
    register_32 LO(big_boy_bus, Clock, Clear, LOin, LO_data_out);
    register_32 INPORT(big_boy_bus, Clock, Clear, INPORTin, INPORT_data_out);
	 //  ^ Uppercase Gaming!!!
    
    // The "Teacher! LuK! I kan du 1 pwas 1!!! It equel tu!" Sector
    register_32 ZHI(Z_data_out[63:32], Clock, Clear, Zin, ZHI_data_out);
    register_32 ZLO(Z_data_out[31:0], Clock, Clear, Zin, ZLO_data_out);
    register_32 Y(big_boy_bus, Clock, Clear, Yin, Y_data_out);
    ALU ALU(Clock, Clear, ALUControl, Y_data_out, big_boy_bus, Z_data_out);

    // The "I Forget" Sector, you know, memory n stuff, why do I even bother...
    register_32 MDR(MDR_data_in, Clock, Clear, MDRin, MDR_data_out);
    register_32 MAR(big_boy_bus, Clock, Clear, MARin, MAR_data_out);
    MDMux MDMux (big_boy_bus, Mdatain, Read, MDR_data_in);

    // The "Stfu datapath use this register" Sector
    wire [4:0] busmux_encoder_selector;
    BusMuxEncoder BusMuxEncoder(
        .R0(R0out),
        .R1(R1out),
        .R2(R2out),
        .R3(R3out),
        .R4(R4out),
        .R5(R5out),
        .R6(R6out),
        .R7(R7out),
        .R8(R8out),
        .R9(R9out),
        .R10(R10out),
        .R11(R11out),
        .R12(R12out),
        .R13(R13out),
        .R14(R14out),
        .R15(R15out),

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