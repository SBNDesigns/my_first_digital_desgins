`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 09:49:13 AM
// Design Name: 
// Module Name: parameterized_adder
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


module parameterized_adder(
a, b, clk, cin, rst, sum, cout
    );
    parameter WIDTH = 4;
    parameter PIPLINED = 1;
    parameter USE_FULL_ADDER = 1;
    input [WIDTH-1:0] a, b;
    input clk, cin, rst;
    output reg [WIDTH-1:0] sum;
    output reg cout;
    reg [WIDTH-1:0] ha_sum_pipelined, fa_sum_pipelined;
    reg ha_cout_pipelined, fa_cout_pipelined;
    wire [WIDTH-1:0] ha_sum_comb, fa_sum_comb;
    wire ha_cout_comb, fa_cout_comb;
   
   assign {fa_cout_comb, fa_sum_comb} = a + b + cin;
   assign {ha_cout_comb, ha_sum_comb} = a + b ;

   always @(posedge clk , rst) begin
    if(rst) begin 
      ha_sum_pipelined <= 0;
      ha_cout_pipelined <= 0;
      fa_sum_pipelined <= 0;
      fa_cout_pipelined <= 0;
    end 
    else begin 
       {ha_cout_pipelined, ha_sum_pipelined} <= a + b ;
       {fa_cout_pipelined, fa_sum_pipelined} <= a + b + cin;
    end 
   end

   always @(*) begin
      if(PIPLINED) begin
         if(USE_FULL_ADDER) begin
            sum = fa_sum_pipelined;
            cout = fa_cout_pipelined;
         end
         else begin
            sum = ha_sum_pipelined;
            cout = ha_cout_pipelined;
         end
      end
      else begin
         if(USE_FULL_ADDER) begin
            sum = fa_sum_comb;
            cout = fa_cout_comb;
         end
         else begin
            sum = ha_sum_comb;
            cout = ha_cout_comb;
         end
      end
   end
                
endmodule