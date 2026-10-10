`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module t_flip_flop_tb;
    reg clk;
    reg reset;
    reg T;
    wire Q;
    // instantiate t flip flop
    t_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .T(T),
        .Q(Q)
    );

    // clock generation
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | Reset=%b | Clock=%b | T=%b | Q=%b",
                 $time, reset, clk, T, Q);

        // initial
        clk = 1'b0;
        reset = 1'b1;
        T = 1'b0;

        // reset active
        #10;

        // =reset release & toggle
        reset = 1'b0;
        T = 1'b1;
        #40;

        // hold
        T = 1'b0;
        #20;

        // toggle
        T = 1'b1;
        #20;

        //  reset
        reset = 1'b1;
        #10;

        // reset release
        reset = 1'b0;
        #20;

        $finish;
    end
endmodule