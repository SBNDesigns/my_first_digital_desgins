`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 07:35:00 AM
// Design Name: 
// Module Name: Q1_dff_tb
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


module Q1_dff_tb(

    );
  
  reg D, CLR, G ; 
  wire Q ; 
  
  
  Q1_dff uut (D , CLR , G , Q);
  
  initial begin 
  D =0; CLR=0;  G =0;
 #1;
  repeat (1000) begin 
    D = $random; G = $random;
    #10; 
    CLR = 1; 
    #100;
    CLR = 0 ; 
    #10;
  end 
  
  end 
endmodule
