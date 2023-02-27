module op_rol_32_tb;

  // Declare inputs and outputs
  reg [31:0] Ain, Bin;
  wire [31:0] Zout;

  // Instantiate module under test
  op_rol_32 dut(
    .Ain(Ain),
    .Bin(Bin),
    .Zout(Zout)
  );

  // Initialize inputs
  initial begin
    Ain = 32'b11000000000000000000000000000000;
    Bin = 32'b00000000000000000000000000000001;
	 
    #10; // 10 nano seconds
	 
    Ain = 32'b00000000000000000000000000000101;
    Bin = 32'b00000000000000000000000000000001;
	 
	#10; // 10 nano seconds
  end
endmodule
