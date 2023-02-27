module op_rol_32(input [31:0] Ain, Bin, output reg [31:0] Zout);
    always @ (*) begin
        Zout = (Ain << Bin) | (Ain >> (32 - Bin));
    end
    // ^ all rol does is is like a shift but restores the ending with what was removed
    // it's like an array being cycled
endmodule