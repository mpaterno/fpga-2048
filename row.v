`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    12:23:16 11/19/2019
// Design Name:
// Module Name:    row
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module row(input [10:0] a_in,
           input [10:0] b_in,
           input [10:0] c_in,
           input [10:0] d_in,
           output [10:0] a_out,
           output [10:0] b_out,
           output [10:0] c_out,
           output [10:0] d_out);

    `include "row_func_1.v"
    reg [43:0] big_vals;
    reg [43:0] regfunction;
    reg [43:0] compute;

    // Need to only computing on a clock cycle. Or some logic like if new instruction, then compute. Currently in a initial block to prevent continuous calling.
    initial begin
        #30; // To allow values to initialize.
        big_vals = {d_in, c_in, b_in, a_in};
        // Call task updateRow and pass in input Array, enable bit, and output Array.
        updateRow(big_vals, 1, compute);
        
    end

    assign d_out = compute[43:33];
    assign c_out = compute[32:22];
    assign b_out = compute[21:11];
    assign a_out = compute[10:0];

endmodule
