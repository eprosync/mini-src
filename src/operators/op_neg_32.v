module op_neg_32(input [31:0] Ain, output [31:0] Zout);
    wire [31:0] temp;

    op_not_32 invert_op(.Ain(Ain), .Zout(temp));
    op_add_32 twos_comp(.Ain(temp), .Bin(32'b0), .Cin(1'd1), .Zout(Zout));
    // note to self: make your naming convention look "professional"
endmodule