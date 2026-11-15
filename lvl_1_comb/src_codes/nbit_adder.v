`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 12:41:52 AM
// Design Name: 
// Module Name: Q4_nbit_adder
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


module Q4_nbit_adder #(parameter N = 1)(
   input [N-1:0] a,b,
   output [N-1:0] c
    );
    assign c = a + b;
endmodule
