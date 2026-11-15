`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 11:08:50 PM
// Design Name: 
// Module Name: Q3_bcd_tb
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


module Q3_bcd_tb();

reg [9:0] D;
wire [3:0] y;
reg [3:0] y_exp;
Q3_bcd uut (D,y);
integer i ;
initial begin 
  repeat(100) begin
  for (i=0; i<10; i=i+1) begin  D = 2**(i); 
  #2;
  case (D) 
    'b0000000001: y_exp = 'b0000;
    'b0000000010: y_exp = 'b0001;
    'b0000000100: y_exp = 'b0010;
    'b0000001000: y_exp = 'b0011;
    'b0000010000: y_exp = 'b0100;
    'b0000100000: y_exp = 'b0101;
    'b0001000000: y_exp = 'b0110;
    'b0010000000: y_exp = 'b0111;
    'b0100000000: y_exp = 'b1000;
    'b1000000000: y_exp = 'b1001;
    
     default y_exp = 'b0000;
     endcase  
     #10; 
     if (y != y_exp)begin  $display ("error "); $stop; end end end
$stop;
end 
endmodule
