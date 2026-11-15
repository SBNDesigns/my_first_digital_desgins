`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 09:50:44 PM
// Design Name: 
// Module Name: Q2_Demux_tb
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


module Q2_Demux_tb(

    );
    reg D;
    reg [1:0] s;
    wire [3:0] Y;
    reg [3:0] Y_exp;
    Q2_Demux M (D , s , Y);
    integer i;
    initial begin 
      D = 1'b1; 
      for (i = 0; i<4; i = i + 1) begin 
        s = i;
       #10;
      case (s) 
       'b00: Y_exp = {3'b000,D} ;
       'b01: Y_exp = {2'b00,D,1'b0} ; 
       'b10: Y_exp = {1'b0,D,2'b00} ;
       'b11: Y_exp = {D,3'b000};
     endcase
       #10;
      if ( Y != Y_exp ) begin 
        $display ("error");  $stop;
         end 
      end 
      $stop;
    end 
endmodule
