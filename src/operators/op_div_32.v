module op_div_32(input [31:0] Ain, Bin, output reg [63:0] Zout);
	reg signed [31:0] A, B;

	always @ (*)
	begin
		A = $signed(Ain);
		B = $signed(Bin);
		Zout = (A - (A % B)) / B;
	end
endmodule