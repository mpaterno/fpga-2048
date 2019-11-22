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

`include "row_func.v"
`include "row_func_1.v"
reg [43:0] big_vals;
reg [43:0] regfunction;
reg [43:0] compute;

initial begin
    #30;
    big_vals = {d_in, c_in, b_in, a_in};
    compute_rc_r(big_vals, 1, compute);

end

//assign compute = compute_rc(big_vals);

// always @ * begin
//     compute <= compute_rc(big_vals);
// end
assign d_out = compute[43:33];
assign c_out = compute[32:22];
assign b_out = compute[21:11];
assign a_out = compute[10:0];

endmodule


// `timescale 1ns / 1ps
// //////////////////////////////////////////////////////////////////////////////////
// // Company:
// // Engineer:
// //
// // Create Date:    12:23:16 11/19/2019
// // Design Name:
// // Module Name:    row
// // Project Name:
// // Target Devices:
// // Tool versions:
// // Description:
// //
// // Dependencies:
// //
// // Revision:
// // Revision 0.01 - File Created
// // Additional Comments:
// //
// //////////////////////////////////////////////////////////////////////////////////
// module row(
//        input [10:0] a_in,
//        input [10:0] b_in,
//        input [10:0] c_in,
//        input [10:0] d_in,
//        output [10:0] a_out,
//        output [10:0] b_out,
//        output [10:0] c_out,
//        output [10:0] d_out
//     );


// reg [43:0] big_vals;
// reg [43:0] regfunction;
//  always@(*)
//     begin
//         big_vals    <= {d_in, c_in, b_in, a_in};
//         regfunction <= compute_rc(big_vals);
//     end


// function [43:0] compute_rc;
//     input [43:0] vals;
//     integer i;
//     integer j;
//     reg [43:0] vals_in;
//     reg [43:0] vals_out;
//     begin
//         $display("Vals_in = %b", vals_in);
//         vals_out          = 44'b0;
//         assign vals_in    = vals;
//             for(i = 3; i > -1; i = i - 1) begin
//                 for(j = i-1; j > -1; j = j-1) begin
//                     if (vals_in[(i*11+11) +: 11] == 11'b0) begin
//                         vals_out[(i*11+11) +: 11] = vals_in[(j*11+11) +: 11];
//                         vals_out[(j*11+11) +: 11] = 11'b0;
//                         $display("This one");
//                         $display("vals_out = %b", vals_out);
//                     end
//                     else if (vals_in[(j*11+11) +: 11] == 11'b0) begin
//                     $display("this two");
//                     $display("vals_out = %b", vals_out);
//                     end
//                     else if (vals_in[(i*11+11) +: 11] == vals_in[(j*11+11) +: 11]) begin
//                         vals_out[(i*11+11) +: 11] = vals_in[(i*11+11) +: 11]*2;
//                         vals_out[(j*11+11) +: 11] = 11'b0;
//                         $display("this three");
//                         $display("vals_out = %b", vals_out);
//                     end
//                     else begin
//                         $display(vals_out);
//                         $display("vals_out = %b", vals_out);
//                         i                  = j;
//                     end
//                 end
//             end
//             compute_rc         = vals_out;
//             $display("vals_out = %b", vals_out);
//     end
//  endfunction
// wire [43:0] compute;
// assign compute = compute_rc(big_vals);

// assign d_out = compute[43:33];
// assign c_out = compute[32:22];
// assign b_out = compute[21:11];
// assign a_out = compute[10:0];

// endmodule
