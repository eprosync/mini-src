module op_and_32(input [31:0] Ain, Bin, output [31:0] Zout);
    genvar i;
    generate
        for (i=0; i<32; i=i+1) begin : loop
            assign Zout[i] = Ain[i] & Bin[i];
        end
    endgenerate
endmodule

// Did you know that originally this was all in VHDL and block diagrams?
// Well guess what, I converted it all, end my suffering please.