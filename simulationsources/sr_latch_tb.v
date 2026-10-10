`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module sr_latch_tb;

    reg S, R;
    wire Q, Qbar;

    // Instantiate the SR latch
    sr_latch uut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        $monitor("Time=%0t | S=%b R=%b | Q=%b Qbar=%b",
                 $time, S, R, Q, Qbar);

        // Initial state
        S = 0; R = 0;
        #10;

        // Set
        S = 1; R = 0;
        #10;

        // Hold
        S = 0; R = 0;
        #10;

        // Reset
        S = 0; R = 1;
        #10;

        // Hold
        S = 0; R = 0;
        #10;

        // Invalid condition
        S = 1; R = 1;
        #10;

        // Return to hold
        S = 0; R = 0;
        #10;

        $finish;
    end

endmodule
