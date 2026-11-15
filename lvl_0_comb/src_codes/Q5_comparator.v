`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 01:06:43 AM
// Design Name: 
// Module Name: Q5_comparator
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


module Q5_comparator(
input [3:0] a,b, 
output a_grtr_b,a_eq_b,a_less_b
    );
    assign a_grtr_b = (a>b)?1:0;
    assign a_eq_b = (a==b)?1: 0;
    assign a_less_b = (a<b)? 1: 0;
endmodule
