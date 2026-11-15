`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 07:37:35 PM
// Design Name: 
// Module Name: one_hot
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


module one_hot(
input [2:0] A,
output reg [6:0] B
    );
    
  always @(*) begin 
    case (A) 
      0: B = 7'b0000000;
      1: B = 7'b0000001;
      2: B = 7'b0000010;
      3: B = 7'b0000100;
      4: B = 7'b0001000;
      5: B = 7'b0010000;
      6: B = 7'b0100000;
      7: B = 7'b1000000;
      default : B = 7'b0000000;
   endcase
  end 
endmodule
