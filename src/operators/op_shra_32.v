module op_shra_32(input [31:0] Ain, Bin, output [31:0] Zout);
    assign Zout = $vector($signed(Ain) >> $signed(Bin));
endmodule