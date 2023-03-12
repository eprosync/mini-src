module RAM(
        input Read, Write,
        inout [31:0] Data,
        input [8:0] Address
    );

    reg [31:0] memory [511:0];

    assign Data = (Read) ? memory[Address] : 32'hzzzzzzzz;

    always @ (posedge Write)
        memory[Address] <= Data;
endmodule