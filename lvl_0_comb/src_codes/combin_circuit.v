`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 11:59:56 AM
// Design Name: 
// Module Name: Q3_combin_circuit
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


module Q3_combin_circuit(
input a,b,c,
output f
    );
  wire xor1,xnor1;
  xor(xor1,a,b);
  xonr(xnor1,b,c);
  assign f = c & xor1 & xnor1 & c ;
endmodule
