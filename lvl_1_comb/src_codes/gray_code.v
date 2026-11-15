`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 07:43:36 PM
// Design Name: 
// Module Name: gray_code
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


module gray_code(
input [2:0] A,
output reg [6:0] B
    );
    
  always @(*) begin 
    case (A) 
      0: B = 7'b0000000;
      1: B = 7'b0000001;
      2: B = 7'b0000011;
      3: B = 7'b0000010;
      4: B = 7'b0000110;
      5: B = 7'b0000111;
      6: B = 7'b0000101;
      7: B = 7'b0000100;
      default : B = 7'b0000000;
   endcase
  end
  endmodule  
