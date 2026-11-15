`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 09:40:05 PM
// Design Name: 
// Module Name: Q2_Demux
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


module Q2_Demux(
   input D , 
   input [1:0] s,
   output reg[3:0] Y 
    );
    
  always @(*) begin 
     case (s) 
       'b00: Y = {3'b000,D} ;
       'b01: Y = {2'b00,D,1'b0} ; 
       'b10: Y = {1'b0,D,2'b00} ;
       'b11: Y = {D,3'b000};
     endcase
  end 
endmodule
