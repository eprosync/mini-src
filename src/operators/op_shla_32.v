module op_shla_32(input [31:0] Ain, Bin, output [31:0] Zout);
    assign Zout = Ain << Bin;
endmodule
// TA -> Why is there an SHLA????
// Me -> "I am very good at driving people insane"