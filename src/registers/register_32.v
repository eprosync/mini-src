module register_32(input [31:0] D, input Clock, Clear, Write, output reg [31:0] Q);
    initial Q = 32'b0; // just so we don't get unknowns

    always @ (posedge Clock) // always run on rising edge of Clock
    // this is similar to process in VHDL but this is ran under conditions
    begin
        if (Clear) begin
            Q = 32'b0;
        end else if (Write) begin // why can't it just be else if...
            Q = D;
        end
    end
endmodule
// How 2 Get into AMD, 1. Write Verilog, 2. Profit?