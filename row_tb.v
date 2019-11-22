`timescale 1ns / 1ps

`include "row.v"

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   12:41:11 11/19/2019
// Design Name:   row
// Module Name:   C:/Users/152/Desktop/project_2048/row_tb.v
// Project Name:  project_2048
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: row
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module row_tb; reg [10:0] a_in; reg [10:0] b_in; reg [10:0] c_in; reg [10:0] d_in; wire [10:0] a_out; wire [10:0] b_out; wire [10:0] c_out; wire [10:0] d_out; row uut (.a_in(a_in), .b_in(b_in), .c_in(c_in), .d_in(d_in), .a_out(a_out), .b_out(b_out), .c_out(c_out), .d_out(d_out));

initial begin
    // Initialize Inputs
    a_in = 0;
    b_in = 0;
    c_in = 8;
    d_in = 8;
    #100
    $display("a = %d",a_out);
    $display("b = %d",b_out);
    $display("c = %d",c_out);
    $display("d = %d",d_out);
    // Wait 100 ns for global reset to finish
    #100;
    
    // Add stimulus here
    
end

endmodule

