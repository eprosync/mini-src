module op_shr_32(input [31:0] Ain, Bin, output [31:0] Zout);
    assign Zout = Ain >> Bin;
endmodule