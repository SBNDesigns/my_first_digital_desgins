`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 12:43:51 AM
// Design Name: 
// Module Name: Q3_decoder
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


module Q3_decoder(
input [1:0]a,
output [3:0] d
    );
   
   assign d = (a=='b00)? 'b0001:
              (a=='b01)? 'b0010:
              (a=='b10)? 'b0100:
              (a=='b11)? 'b1000: 'b0000; 
    
endmodule
