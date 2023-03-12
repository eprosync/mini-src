module select_encoder(
        input Gra, Grb, Grc, Rin, Rout, BAout,
        input [31:0] IR, // this is our instruction
        output [31:0] C_sign_extended, // this is the immediate
        output [15:0] Rin_cs, Rout_cs // this is the control signals for each register 0-15
    );

    wire [3:0] Opcode;
    wire [3:0] Decoder_input;
    wire [15:0] Decoder_output;

    // {4{wire}} means convert from 1 to 4
    assign opcode = IR[31:27];
    assign Decoder_input = (IR[26:23] & {4{Gra}}) | (IR[22:19] & {4{Grb}}) | (IR[18:15] & {4{Grc}});

    case(Decoder_input)
        4'b0000 : Decoder_output = 16'h0001;
        4'b0001 : Decoder_output = 16'h0002;
        4'b0010 : Decoder_output = 16'h0004;
        4'b0011 : Decoder_output = 16'h0008;
        4'b0100 : Decoder_output = 16'h0010;
        4'b0101 : Decoder_output = 16'h0020;
        4'b0110 : Decoder_output = 16'h0040;
        4'b0111 : Decoder_output = 16'h0080;
        4'b1000 : Decoder_output = 16'h0100;
        4'b1001 : Decoder_output = 16'h0200;
        4'b1010 : Decoder_output = 16'h0400;
        4'b1011 : Decoder_output = 16'h0800;
        4'b1100 : Decoder_output = 16'h1000;
        4'b1101 : Decoder_output = 16'h2000;
        4'b1110 : Decoder_output = 16'h4000;
        4'b1111 : Decoder_output = 16'h8000;
    endcase

    // extracts the 18 downto 0 immediate, but also if the 18'th bit is 1 then the upper 13 will be 1
    assign C_sign_extended = {13{IR[18]},IR[18:0]};
    assign Rin_cs = {16{Rin}} & Decoder_output;
    assign Rout_cs = {16{Rout} | 16{BAout}} & Decoder_output;

endmodule