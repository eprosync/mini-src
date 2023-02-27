module op_not_32(input [31:0] Ain, output [31:0] Zout);
    genvar i;
    generate
        for (i=0; i<32; i=i+1) begin : loop
            assign Zout[i] = !Ain[i];
        end
    endgenerate
endmodule