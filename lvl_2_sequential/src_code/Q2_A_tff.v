`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2026 12:37:59 PM
// Design Name: 
// Module Name: Q2_A_tff
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


module Q2_A_tff(
  input t,rstn, clk,
  output reg q, 
  output qbar
    );
    
    always @(posedge clk , negedge rstn) begin 
     if (!rstn)  
         q <= 0;
     else if (t) q <= ~q;
     else q <= q; 
    end 
    
   assign qbar = ~q;
endmodule
