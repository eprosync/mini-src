module op_shra_32(input reg [31:0] Ain, Bin, output reg [31:0] Zout);
    integer i;
    reg [31:0] temp = 32'b0;
    always @ (*)
    begin
        if (Ain[32]) begin
            // Clamp Bin to be 0 < Bin <= 32
            for (i=0; i<(Bin & 32'b011111); i=i+1) begin : loop
                temp[32-i] = 1;
            end
        end
        // arithmetic shift means it keeps it negative, unlike a normal shift
        Zout = (Ain >> Bin) | temp;
    end
endmodule