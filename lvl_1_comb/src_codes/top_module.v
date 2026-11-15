`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 07:48:55 PM
// Design Name: 
// Module Name: Q1_top_module
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


module Q1_top_module #(parameter USE_GRAY = 1)(
 input [2:0] A,
 output [6:0] B
    );
    
 generate 
  if (USE_GRAY == 1) gray_code M1 (A, B);
  else one_hot M2 (A , B);
 endgenerate 
endmodule
