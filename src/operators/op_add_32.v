module op_add_32(input [31:0] Ain, Bin, input wire Cin, output [31:0] Zout, output wire Cout);
	wire Cout1; // since we need to carry it over

	CLA16 OP1(.Ain(Ain[15:0]), .Bin(Bin[15:0]), .Cin(Cin), .Zout(Zout[15:0]), .Cout(Cout1));
	CLA16 OP2(.Ain(Ain[31:16]), .Bin(Bin[31:16]), .Cin(Cout1), .Zout(Zout[31:16]), .Cout(Cout));
endmodule

module CLA16(input [15:0] Ain, Bin, input wire Cin, output [31:0] Zout, output wire Cout);
	wire Cout1, Cout2, Cout3;
	// ^ we need to carry these over to the other ripple carriers

	CLA4 OP1(.Ain(Ain[3:0]), .Bin(Bin[3:0]), .Cin(Cin), .Zout(Zout[3:0]), .Cout(Cout1));
	CLA4 OP2(.Ain(Ain[7:4]), .Bin(Bin[7:4]), .Cin(Cout1), .Zout(Zout[7:4]), .Cout(Cout2));
	CLA4 OP3(.Ain(Ain[11:8]), .Bin(Bin[11:8]), .Cin(Cout2), .Zout(Zout[11:8]), .Cout(Cout3));
	CLA4 OP4(.Ain(Ain[15:12]), .Bin(Bin[15:12]), .Cin(Cout3), .Zout(Zout[15:12]), .Cout(Cout));
endmodule

// Just when I thought things could get some-what okay
// But no, I had to stress over multiplication...
module CLA4(input [3:0] Ain, Bin, input wire Cin, output [3:0] Zout, output wire Cout);
	wire [3:0] P, G, c;
	
	assign P = Ain ^ Bin;
	assign G = Ain & Bin;
	
	assign c[0] = Cin; // G0 + P0C0
	assign c[1] = G[0] | (P[0] & c[0]); // G1 + P1C1 = G1 + P1G0 + P1P0G0
	assign c[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c[0]);
	assign c[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c[0]);
	
	assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c[0]);
	assign Zout = P ^ c;
endmodule

// My version of this in VHDL was WAYYYY worse, thanks lecture slides for Verilog...