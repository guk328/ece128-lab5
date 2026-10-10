`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module sr_flip_flop (
    input  clk,
    input  S,
    input  R,
    output reg Q,
    output Qbar
);

    always @(posedge clk) begin
        case ({S, R})
            2'b00: begin
                Q <= Q;       // Hold
            end

            2'b01: begin
                Q <= 1'b0;    // Reset
            end

            2'b10: begin
                Q <= 1'b1;    // Set
            end

            2'b11: begin
                Q <= 1'bx;    // Invalid
            end
        endcase
    end
   assign Qbar = ~Q;
endmodule
