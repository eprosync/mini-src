module op_or_32_tb;

  // Declare inputs and outputs
  reg [31:0] Ain, Bin;
  reg Cin;
  wire [31:0] Zout;
  wire Cout;

  // Instantiate module under test
  op_or_32 dut(
    .Ain(Ain),
    .Bin(Bin),
    .Cin(Cin),
    .Zout(Zout),
    .Cout(Cout)
  );

  // Initialize inputs
  initial begin
    Ain = 32'b00000000000000000000000000001010;
    Bin = 32'b00000000000000000000000000001001;
    Cin = 0;
	 
    #10; // 10 nano seconds
	 
    Ain = 32'b00000000000000000000000000000101;
    Bin = 32'b00000000000000000000000000000101;
    Cin = 0;
	 
	#10; // 10 nano seconds
  end
endmodule
