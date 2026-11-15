`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 07:17:44 PM
// Design Name: 
// Module Name: Q2_B_asyn_dff
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


module Q2_B_asyn_dff(
 input d, rstn, clk,
 output reg q, 
 output qbar
    );
    
  always @(posedge clk , negedge rstn) begin 
    if (!rstn) q <=0;
    else q <= d;
  end 
  assign qbar = ~q;
endmodule
