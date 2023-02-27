module register_64(input [63:0] D, input Clock, Clear, Write, output reg [63:0] Q);
    // ^ reg = variable, rest = wires, neat right?
    initial Q = 64'b0; // just so we don't get unknowns

    always @ (posedge Clock) // always run on rising edge of Clock
    // this is similar to process in VHDL but this is ran under conditions
    begin
        if (Clear) begin
            Q = 64'b0;
        end else if (Write) begin // why can't it just be else if...
            Q = D;
        end
    end
endmodule
// Please send help, idk how but I did this all in like a day...