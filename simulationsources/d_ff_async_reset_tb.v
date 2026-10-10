`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module d_ff_async_reset_tb;
    reg clk;
    reg d;
    reg rstn;
    reg [2:0] delay;
    wire q;
    integer i;

    // d flip flop w/ asynch reset
    d_ff_async_reset dff0 (
        .d(d),
        .rstn(rstn),
        .clk(clk),
        .q(q)
    );

    // clock
    always #10 clk = ~clk;

    // testcase
    initial begin
        $monitor("Time=%0t | CLK=%b | rstn=%b d=%b | q=%b", $time, clk, rstn, d, q);
        clk <= 0;
        d <= 0;
        rstn <= 0;

        #15 d <= 1;
        #10 rstn <= 1;

        // loop to change d at random times
        for (i = 0; i < 5; i = i + 1) begin
            delay = $random;
            #(delay) d <= i;
        end

        // reset b/w clock edges to show reset timing
        #20 d <= 1;
        @(posedge clk);
        #5  rstn <= 0; // q clears w/o clock edge
        #20 rstn <= 1;
        #40;
        $finish;
    end
endmodule