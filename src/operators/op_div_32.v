module op_div_32(input [31:0] Ain, Bin, output [63:0] Zout);
    reg [64:0] dividend_storage;
    reg signed [31:0] divisor_storage;
    reg signed [31:0] remainder_storage;
    reg [31:0] clamp;
    reg q;
    integer i, length;

    // Restoring division algorithm, yep, I wana die
    always @ (*) begin
		// Setup, because... yes?
        dividend_storage = $signed(Ain); // This is Q
        divisor_storage = $signed(Bin); // This is M
        remainder_storage = divisor_storage; // This is A
        q = 0;

        // Get the bit length of Q
        for (i=0; i<31; i=i+1) begin : find_bit_length
            if (Ain[i]) begin
                length = i;
            end
        end

        // Create a clamp to prevent bits from going outside the length
        for (i=0; i<length; i=i+1) begin : create_clamp
            clamp[i] = 1;
        end
        
        // Now use a for loop for it all
        for (i=0; i<length; i=i+1) begin : restore_division
            if (i == 0) begin
                remainder_storage = {remainder_storage[31:1], 1'b0};
                // This is a right shift
            end else begin
                remainder_storage = {1'b0, remainder_storage[30:0]};
                // This is a left shift
            end

            remainder_storage = remainder_storage - divisor_storage;
            
            if (remainder_storage[31]) begin
                q = 0;
                remainder_storage = remainder_storage + divisor_storage;
            end else begin
                q = 1;
            end

            dividend_storage = {remainder_storage[31:1], 1'b0};
            dividend_storage[0] = q;
        end

        dividend_storage = dividend_storage & clamp; // apply clamp
    end

    assign Zout = dividend_storage[63:0];
endmodule