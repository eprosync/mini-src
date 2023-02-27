module increment_pc_32(input [31:0] D, input Clock, Increment, Write, output reg [31:0] Q);
    initial Q = 32'b0; // just so we don't get unknowns

    always @ (posedge Clock) // always run on rising edge of Clock
    // this is similar to process in VHDL but this is ran under conditions
    begin
        if (Write) begin
            if (Increment) begin
                Q = Q + 1;
            end else begin
                Q = D;
            end
        end
    end
endmodule