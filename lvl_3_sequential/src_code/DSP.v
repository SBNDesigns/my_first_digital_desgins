`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 07:01:32 AM
// Design Name: 
// Module Name: DSP
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


module DSP(A, B, C, D, clk, rst_n, P);
input [17:0] A, B, D;
input [47:0] C;
input clk , rst_n;
output reg [47:0] P;

parameter OPERATION = "ADD" ;
reg [17:0] A_reg1,A_reg2, B_reg, D_reg;
reg [47:0] C_reg;
reg [17:0] sum_d_b;
reg [35:0] mult_out;

always @(posedge clk, negedge rst_n) begin
  if(!rst_n) begin 
     A_reg1 <= 0;
     A_reg2 <= 0;
     B_reg <= 0;
     D_reg <= 0;
     C_reg <= 0;
     P <= 0;
     sum_d_b <= 0;
     mult_out <= 0;
  end
  else begin
     A_reg1 <= A;
     A_reg2 <= A_reg1;
     B_reg <= B;
     D_reg <= D;
     C_reg <= C;
     
     mult_out <= A_reg2 * sum_d_b;
     if(OPERATION == "ADD") begin
        P <= mult_out + C_reg;
        sum_d_b <= D_reg + B_reg;
     end
     else if(OPERATION == "SUB") begin
        P <= mult_out - C_reg;
        sum_d_b <= D_reg - B_reg;
     end
  end   
end
endmodule
