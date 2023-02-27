module BusMuxEncoder(
        // general registers
        input R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15,
        // special registers
        input HI, LO, ZHI, ZLO, PC, MDR, InPort, C,
        output reg [4:0] Control
    );

    always @ (*) begin
		  Control = 5'b00000;
        if (R0) Control = 5'b00000;
        else if (R1) Control = 5'b00001;
        else if (R2) Control = 5'b00010;
        else if (R3) Control = 5'b00011;
        else if (R4) Control = 5'b00100;
        else if (R5) Control = 5'b00101;
        else if (R6) Control = 5'b00110;
        else if (R7) Control = 5'b00111;
        else if (R8) Control = 5'b01000;
        else if (R9) Control = 5'b01001;
        else if (R10) Control = 5'b01010;
        else if (R11) Control = 5'b01011;
        else if (R12) Control = 5'b01100;
        else if (R13) Control = 5'b01101;
        else if (R14) Control = 5'b01110;
        else if (R15) Control = 5'b01111;
        else if (HI) Control = 5'b10000;
        else if (LO) Control = 5'b10001;
        else if (ZHI) Control = 5'b10010;
        else if (ZLO) Control = 5'b10011;
        else if (PC) Control = 5'b10100;
        else if (MDR) Control = 5'b10101;
        else if (InPort) Control = 5'b10110;
        else if (C) Control = 5'b10111;
    end

endmodule
