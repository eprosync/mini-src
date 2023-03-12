module ALU(
    input Clock, Clear,
    input [4:0] Control,
    input [31:0] reg_A, reg_B,
    output reg [63:0] reg_C);

    // If you one-line all of this, it will be the end of you.
    parameter
        add_select = 5'b00000,
        sub_select = 5'b00001,
        mul_select = 5'b00010,
        div_select = 5'b00011,

        shl_select = 5'b00100,
        shr_select = 5'b00101,
        shla_select = 5'b00111,
        shra_select = 5'b01000,
        rol_select = 5'b01001,
        ror_select = 5'b01010,

        and_select = 5'b01011,
        or_select = 5'b01100,
        not_select = 5'b01101,
        neg_select = 5'b01110,
        
        load_select = 5'b01111,
        load_imm_select = 5'b10000,
        store_select = 5'b10001,

        addi_select = 5'b10010,
        andi_select = 5'b10011,
        ori_select = 5'b10100,

        // for CON FF logic
        brzr_select = 5'b10101,
        brnz_select = 5'b10110,
        brmi_select = 5'b10111,
        brpl_select = 5'b11000,
        
        jr_select = 5'b11001,
        jal_select = 5'b11010,

        mfhi_select = 5'b11011,
        mflo_select = 5'b11100,

        in_select = 5'b11101,
        out_select = 5'b11110;

    // I hate this but this works
    wire [31:0] add_out, sub_out;
    op_add_32 add_op (.Ain(reg_A),.Bin(reg_B),.Cin(1'b0),.Zout(add_out));
    op_sub_32 sub_op (.Ain(reg_A),.Bin(reg_B),.Zout(sub_out));
	 
	wire [63:0] mul_out, div_out;
    op_mul_32 mul_op (.Ain(reg_A),.Bin(reg_B),.Zout(mul_out));
    op_div_32 div_op (.Ain(reg_A),.Bin(reg_B),.Zout(div_out));
	 
	wire [31:0] shl_out, shr_out, shla_out, shra_out, rol_out, ror_out, and_out, or_out;
    op_shl_32 shl_op (.Ain(reg_A),.Bin(reg_B),.Zout(shl_out));
    op_shr_32 shr_op (.Ain(reg_A),.Bin(reg_B),.Zout(shr_out));
    op_shla_32 shla_op (.Ain(reg_A),.Bin(reg_B),.Zout(shla_out));
    op_shra_32 shra_op (.Ain(reg_A),.Bin(reg_B),.Zout(shra_out));
    op_rol_32 rol_op (.Ain(reg_A),.Bin(reg_B),.Zout(rol_out));
    op_ror_32 ror_op (.Ain(reg_A),.Bin(reg_B),.Zout(ror_out));
    op_and_32 and_op (.Ain(reg_A),.Bin(reg_B),.Zout(and_out));
    op_or_32 or_op (.Ain(reg_A),.Bin(reg_B),.Zout(or_out));
    
	wire [31:0] not_out, neg_out;
    op_not_32 not_op (.Ain(reg_B),.Zout(not_out));
    op_neg_32 neg_op (.Ain(reg_B),.Zout(neg_out));

    always @ (*)
    begin 
        case(Control)
            add_select, addi_select: begin
                reg_C[31:0] = add_out;
                reg_C[63:32] = 32'b0;
            end
            sub_select: begin
                reg_C[31:0] = sub_out;
                reg_C[63:32] = 32'b0;
            end

            mul_select: begin
                reg_C = mul_out;
            end
            div_select: begin
                reg_C = div_out;
            end

            shl_select: begin
                reg_C[31:0] = shl_out;
                reg_C[63:32] = 32'b0;
            end
            shr_select: begin
                reg_C[31:0] = shr_out;
                reg_C[63:32] = 32'b0;
            end
            shla_select: begin
                reg_C[31:0] = shla_out;
                reg_C[63:32] = 32'b0;
            end
            shra_select: begin
                reg_C[31:0] = shra_out;
                reg_C[63:32] = 32'b0;
            end
            rol_select: begin
                reg_C[31:0] = rol_out;
                reg_C[63:32] = 32'b0;
            end
            ror_select: begin
                reg_C[31:0] = ror_out;
                reg_C[63:32] = 32'b0;
            end

            and_select, andi_select: begin
                reg_C[31:0] = and_out;
                reg_C[63:32] = 32'b0;
            end
            or_select, ori_select: begin
                reg_C[31:0] = or_out;
                reg_C[63:32] = 32'b0;
            end
            not_select: begin
                reg_C[31:0] = not_out;
                reg_C[63:32] = 32'b0;
            end
            neg_select: begin
                reg_C[31:0] = neg_out;
                reg_C[63:32] = 32'b0;
            end
        endcase
    end
endmodule