module op_shra_32(input [31:0] Ain, Bin, output [31:0] Zout);
    integer i;
    wire [31:0] storage;
    reg [31:0] compliments = 32'b0;
    reg [31:0] results;

    op_shr_32 shift(Ain, Bin, storage);

    always @ (*)
    begin
        if (Ain[31]) begin // So the problem was... I accessed it at 32 instead of 31...
            // Clamp Bin to be 0 < Bin <= 32
            for (i=0; i<(Bin & 32'b011111); i=i+1) begin : maintain_negative
                compliments[32-i] = 1;
            end
            // This simply just makes bits for the shift
            // ex: if Bin = 2
            // then temp = 32'b110...0
        end
        // arithmetic shift means it keeps it negative, unlike a normal shift
        results = storage | compliments;
    end

    assign Zout = results;
endmodule