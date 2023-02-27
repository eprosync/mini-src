module op_or_32(input [31:0] Ain, Bin, output [31:0] Zout);
    genvar i;
    generate // like process, so you can use for loops n stuff...
        // ^ don't ask me why you even need this lol
        for (i=0; i<32; i=i+1) begin : loop
            assign Zout[i] = Ain[i] | Bin[i];
        end
    endgenerate
endmodule