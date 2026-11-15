`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 07:58:32 PM
// Design Name: 
// Module Name: Q3_bcd
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


module Q3_bcd(
  input [9:0] D,
  output reg [3:0] y
    );
    
    always @(*) begin 
    case (D) 
    'b0000000001: y = 'b0000;
    'b0000000010: y = 'b0001;
    'b0000000100: y = 'b0010;
    'b0000001000: y = 'b0011;
    'b0000010000: y = 'b0100;
    'b0000100000: y = 'b0101;
    'b0001000000: y = 'b0110;
    'b0010000000: y = 'b0111;
    'b0100000000: y = 'b1000;
    'b1000000000: y = 'b1001;
    
     default y = 'b0000;
     endcase
    end 
endmodule
