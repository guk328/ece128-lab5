`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//
// Divides a 100 MHz input clock by 4 to produce 25 MHz.
// clock_out toggles every 2 input cycles, so one full output period = 4 input cycles.
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(clock_in, clock_out);

    input clock_in;
    output reg clock_out = 1'b0;

    reg [1:0] counter = 2'd0;
    always @(posedge clock_in) begin
        counter <= counter + 1;
        if (counter == 2'b01) begin
            clock_out <= ~clock_out;   // Toggle the output clock
            counter <= 0;
        end
    end
endmodule