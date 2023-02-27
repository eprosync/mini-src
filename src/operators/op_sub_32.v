module op_sub_32(input [31:0] Ain, Bin, output [31:0] Zout);
    wire [31:0] negated;

    // Super pog subtractor!!!
    op_neg_32 invert(.Ain(Bin), .Zout(negated));
    op_add_32 subtract(.Ain(Ain), .Bin(negated), .Cin(32'b0), .Zout(Zout));
endmodule