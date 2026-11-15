`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 07:30:39 PM
// Design Name: 
// Module Name: Q2_pencoder_tb
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


module Q2_pencoder_tb(

    );
    reg [3:0] x;
    wire [1:0] y;
    reg [1:0] y_expected;
    priority_encoder_Q2 uut (x,y);
    
    initial  begin 
    repeat(40) begin 
     x = $random;
    #3;
       casex (x)  
       'b1xxx: y_expected = 'b11;
       'b01xx:y_expected = 'b10;
       'b001x: y_expected = 'b01;
       'b000x:y_expected = 'b00;
       
       default: y_expected = 0;
       endcase 
      #10;
      if(y != y_expected) begin 
       $display ("unexpected output");
       end 
     
    end 
    $stop;
    end 
endmodule
