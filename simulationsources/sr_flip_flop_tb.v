`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////

module sr_flip_flop_tb;

    reg clk;
    reg S, R;
    wire Q, Qbar;

    // Instantiate the SR flip-flop
    sr_flip_flop uut (
        .clk(clk),
        .S(S),
        .R(R),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Generate clock
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | CLK=%b | S=%b R=%b | Q=%b Qbar=%b",
                 $time, clk, S, R, Q, Qbar);

        clk = 0;
        S = 0;
        R = 0;
        // Hold
        #10;
        
        // Set
        S = 1;
        R = 0;
        #10;

        // Hold
        S = 0;
        R = 0;
        #10;

        // Reset
        S = 0;
        R = 1;
        #10;

        // Hold
        S = 0;
        R = 0;
        #10;

        // Invalid
        S = 1;
        R = 1;
        #10;

        // Finish simulation
        $finish;
    end

endmodule
