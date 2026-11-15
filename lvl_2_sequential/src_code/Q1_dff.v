`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 07:24:51 AM
// Design Name: 
// Module Name: Q1_dff
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


module Q1_dff(
input D , CLR , G ,  
output reg Q
    );
    
  always @(*) begin 
    if (!CLR) Q <= 0;
    else if (G) Q <= D ; 
  end 
endmodule  
