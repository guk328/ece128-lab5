`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module clk_tb;

    reg clock_in;
    wire clock_out;

    // instantiate clock divider
    clock_divider uut (
        .clock_in(clock_in),
        .clock_out(clock_out)
    );

    // 100 Mhz input clock w/ 10 ns period
    initial begin
        clock_in = 0;
        forever #5 clock_in = ~clock_in;
    end

    initial begin
        $monitor("Time=%0t | clock_in=%b | clock_out=%b", $time, clock_in, clock_out);
        #200;
        $finish;
    end
endmodule