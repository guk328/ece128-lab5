`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module d_ff_sync_reset (
    input d,
    input rstn,
    input clk,
    output reg q
);

    // rstn is only checked on rising clock edge
    always @(posedge clk) begin
        if (!rstn)
            q <= 0;      // reset
        else
            q <= d;      // load D
    end
endmodule