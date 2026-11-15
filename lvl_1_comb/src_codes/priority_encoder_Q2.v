`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 07:23:26 PM
// Design Name: 
// Module Name: priority_encoder_Q2
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


module priority_encoder_Q2(
  input [3:0]x,
  output reg [1:0]y
    );
    always @(*) begin 
       casex (x)  
       'b1xxx: y = 'b11;
       'b01xx: y = 'b10;
       'b001x: y = 'b01;
       'b000x: y = 'b00;
       
       default: y = 0;
       endcase 
      
    end 
endmodule
