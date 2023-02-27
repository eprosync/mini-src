`timescale 1ns/10ps
module phase1_mul_tb;
    reg Clock;
    reg R6in, R7in, HIin, LOin;
    reg MARin, Zin, PCin, MDRin, IRin, Yin;
    reg R6out, R7out;
    reg PCout, ZHIout, ZLOout, MDRout;
    reg IncrementPC;
    reg Read;
    reg [4:0] ALUControl;
    reg [31:0] Mdatain;

    wire [31:0] R6_data_out, R7_data_out, MuxBusOut;
	wire [31:0] MDR_data_in, MDR_data_out, Y_data_out, Z_data_out;
	wire [31:0] HI_data_out, LO_data_out;

    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
    Reg_load2b = 4'b0100, T0 = 4'b0101, T1 = 4'b0110, T2 = 4'b0111, T3 = 4'b1000, T4 = 4'b1001, T5 = 4'b1010, T6 = 4'b1011;

    reg [3:0] Present_state = Default;
    phase1 DUT(
        .Clock(Clock),

        .R6in(R6in), .R7in(R7in),
        .MARin(MARin), .Zin(Zin), .PCin(PCin), .MDRin(MDRin), .IRin(IRin), .Yin(Yin),
        .IncrementPC(IncrementPC),

        .PCout(PCout), .ZHIout(ZHIout), .ZLOout(ZLOout), .MDRout(MDRout),
        .R6out(R6out), .R7out(R7out),
        .HIin(HIin), .LOin(LOin),

        .R6_data_out(R6_data_out), .R7_data_out(R7_data_out),
        .big_boy_bus(MuxBusOut),
        .MDR_data_in(MDR_data_in),
        .MDR_data_out(MDR_data_out),
        .Z_data_out(Z_data_out),
        .Y_data_out(Y_data_out),
        .HI_data_out(HI_data_out),
        .LO_data_out(LO_data_out),

        .Read(Read), .ALUControl(ALUControl),
        .Mdatain(Mdatain)
    );

    // add test logic here
    initial
    begin
        Clock = 0;
        forever #10 Clock = ~ Clock;
    end

    always @(posedge Clock) // finite state machine; if clock rising-edge
    begin
        case (Present_state)
            Default : #40 Present_state = Reg_load1a;
            Reg_load1a : #40 Present_state = Reg_load1b;
            Reg_load1b : #40 Present_state = Reg_load2a;
            Reg_load2a : #40 Present_state = Reg_load2b;
            Reg_load2b : #40 Present_state = T0;
            T0 : #40 Present_state = T1;
            T1 : #40 Present_state = T2;
            T2 : #40 Present_state = T3;
            T3 : #40 Present_state = T4;
            T4 : #40 Present_state = T5;
        endcase
    end

    always @(Present_state) // do the required job in each state
    begin
        case (Present_state) // assert the required signals in each clock cycle
            Default: begin
                PCout <= 0; ZLOout <= 0; ZHIout <= 0; MDRout <= 0; // initialize the signals
                R6out <= 0; R7out <= 0; MARin <= 0; Zin <= 0; HIin <= 0; LOin <= 0;
                PCin <=0; MDRin <= 0; IncrementPC <= 0; IRin <= 0; Yin <= 0;
                Read <= 0; ALUControl <= 5'b0;
                R6in <= 0; R7in <= 0; Mdatain <= 32'h00000000;
            end
            Reg_load1a: begin
                Mdatain <= 32'h00000012;
                Read = 0; MDRin = 0; // the first zero is there for completeness
                #10 Read <= 1; MDRin <= 1;
                #15 Read <= 0; MDRin <= 0;
            end
            Reg_load1b: begin
                #10 MDRout <= 1; R6in <= 1;
                #15 MDRout <= 0; R6in <= 0; // initialize R6 with the value $12
            end
            Reg_load2a: begin
                Mdatain <= 32'h00000014;
                #10 Read <= 1; MDRin <= 1;
                #15 Read <= 0; MDRin <= 0;
            end
            Reg_load2b: begin
                #10 MDRout <= 1; R7in <= 1;
                #15 MDRout <= 0; R7in <= 0; // initialize R7 with the value $14
            end

            T0: begin // see if you need to de-assert these signals
                PCout <= 1; MARin <= 1; Zin <= 1;
                #20;
            end
            T1: begin
                PCout <= 0; MARin <= 0; Zin <= 0;
                ZLOout <= 1; PCin <= 1; IncrementPC <= 1; Read <= 1; MDRin <= 1;
                Mdatain <= 32'h28918000; // opcode for “and R1, R6, R7”
                #10;
                PCin <= 0; IncrementPC <= 0;
                #10;
            end
            T2: begin
                ZLOout <= 0; Read <= 0; MDRin <= 0;
                MDRout <= 1; IRin <= 1;
                #20;
            end
            T3: begin
                MDRout <= 0; IRin <= 0;
                R6out <= 1; Yin <= 1;
                #20;
            end
            T4: begin
				R6out <= 0; Yin <= 0;
                R7out <= 1; ALUControl <= 5'b00010; Zin <= 1;
                #20;
            end
            T5: begin
                R7out <= 0; ALUControl <= 5'b0; Zin <= 0;
                ZLOout <= 1; LOin <= 1;
                #20;
            end
            T6: begin
                ZLOout <= 0; LOin <= 0;
                ZHIout <= 1; HIin <= 1;
                #20;
            end
        endcase
    end
endmodule