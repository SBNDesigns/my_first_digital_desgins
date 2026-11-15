`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 01:03:24 AM
// Design Name: 
// Module Name: Q4_parity_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Q4_parity_generator(
input [7:0] a,
output [8:0]out_with_parity
    );
    assign out_with_parity = {a,^a};
endmodule
