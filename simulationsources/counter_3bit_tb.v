`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module counter_3bit_tb;

    reg clk;
    reg reset;
    wire [2:0] Q;

    // Instantiate 3-bit counter
    counter_3bit uut (
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | Reset=%b | Clock=%b | Q=%b",
                 $time, reset, clk, Q);

        // Initial values
        clk = 1'b0;
        reset = 1'b1;

        // Keep reset active
        #10;

        // Release reset
        reset = 1'b0;

        // Allow counter to run
        #80;

        // Apply reset again
        reset = 1'b1;
        #10;

        // Release reset
        reset = 1'b0;

        #40;

        $finish;
    end

endmodule
