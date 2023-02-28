module op_div_32_tb;

  // Declare inputs and outputs
  reg [31:0] Ain, Bin;
  wire [63:0] Zout;

  // Instantiate module under test
  op_div_32 dut(
    .Ain(Ain),
    .Bin(Bin),
    .Zout(Zout)
  );

  // Initialize inputs
  initial begin
    Ain = 32'h00000002;
    Bin = 32'h00000002;
        
    #10; // 10 nano seconds
        
    Ain = 32'b1000;
    Bin = 32'b0011;
        
    #10; // 10 nano seconds
  end
endmodule
