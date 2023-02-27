module op_ror_32(input [31:0] Ain, Bin, output reg [31:0] Zout);
    always @ (*) begin
        Zout = (Ain >> Bin) | (Ain << (32 - Bin));
    end
endmodule