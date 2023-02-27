module op_not_32_tb;

  // Declare inputs and outputs
  reg [31:0] Ain;
  wire [31:0] Zout;

  // Instantiate module under test
  op_not_32 dut(
    .Ain(Ain),
    .Zout(Zout)
  );

  // Initialize inputs
  initial begin
    Ain = 32'h00000001;
	#10; // 10 nano seconds
  end
endmodule
