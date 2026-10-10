`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module d_ff_async_reset (
    input d,
    input rstn,
    input clk,
    output reg q
);

    // rstn going low clears q w/o clock
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            q <= 0; // Reset
        else
            q <= d; // Load D
    end
endmodule