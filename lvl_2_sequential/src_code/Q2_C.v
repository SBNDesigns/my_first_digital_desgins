`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 07:21:23 PM
// Design Name: 
// Module Name: Q2_C
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


module Q2_C #(parameter FF_TYPE = "DFF")(
  input d, rstn , clk , 
  output reg q, 
  output qbar
    );
   always @( posedge clk , negedge rstn ) begin 
     if (!rstn) q <= 0; 
     else if (FF_TYPE == "DFF") q <= d;
     else if (FF_TYPE == "TFF") q <= (d)? ~q:q;
   end  
   assign qbar = ~q;
endmodule
