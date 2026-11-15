`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 11:50:43 AM
// Design Name: 
// Module Name: Q1_comparator
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


module Q1_comparator(
 input [3:0] a,
 output out
    );
  assign out = (a>'b0010 && a< 'b1000)?1:0;
endmodule
