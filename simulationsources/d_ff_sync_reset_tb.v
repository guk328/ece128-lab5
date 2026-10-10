`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module d_ff_sync_reset_tb;
    reg clk;
    reg d;
    reg rstn;
    reg [2:0] delay;
    wire q;
    integer i;

    // instantiate w with synchronous reset
    d_ff_sync_reset dff0 (
        .d(d),
        .rstn(rstn),
        .clk(clk),
        .q(q)
    );

    // clock
    always #10 clk = ~clk;

    // testcases
    initial begin
        $monitor("Time=%0t | CLK=%b | rstn=%b d=%b | q=%b", $time, clk, rstn, d, q);

        clk <= 0;
        d <= 0;
        rstn <= 0;

        #15 d <= 1;
        #10 rstn <= 1;

        // loop for changing d at random times
        for (i = 0; i < 5; i = i + 1) begin
            delay = $random;
            #(delay) d <= i;
        end

        #20 d <= 1;
        @(posedge clk);
        #5  rstn <= 0;     // q waits for the next rising edge to clear
        #20 rstn <= 1;

        #40;
        $finish;
    end

endmodule