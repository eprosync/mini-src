`timescale 1ns / 10ps


// This is a test-bench template, you can use this to build and create different test benches
module tb;
    // here you create your TB signals
    // in this case for verilog we use reg, as its a variable
    reg a;
    reg [31:0] b;

    // here we create the component and assign values
    // remember to give it's ID as DUT
    some_component DUT(.a(a), .b(b))
    // ^ here I am linking register a and b to the ports

    initial
    begin
        a = 0;
        b = 32'h0000_0000;
        #10 // wait 
    end

endmodule;