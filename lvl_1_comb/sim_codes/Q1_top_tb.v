`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 08:01:19 PM
// Design Name: 
// Module Name: Q1_top_tb
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


module Q1_top_tb(

    );
    parameter USE_GRAY = 1 ; 
    reg [2:0] A ; 
    wire [6:0] B ; 
    
    Q1_top_module #(0) uut (A, B);
    integer i ;
    initial begin 
     for ( i = 0; i<8; i = i + 1 ) begin 
      A = i ; 
      #10;
     end 
     $stop;
    end 
endmodule
