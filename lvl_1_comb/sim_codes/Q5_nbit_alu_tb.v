`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 01:17:04 AM
// Design Name: 
// Module Name: Q5_nbit_alu_tb
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


module Q5_nbit_alu_tb(

    );
    parameter N = 4; 
    reg [N-1:0] a,b;
    reg [1:0] opcode; 
    reg [N-1:0] result_exp;
    wire [N-1:0] result;
    
    Q5_nbit_alu #(N) uut (a,b,opcode, result);
    
    initial begin 
     repeat(50) begin 
      a = $random; b= $random; opcode = $random;
      #4; 
      case (opcode)
       0: result_exp = a+b;
       1: result_exp = a|b;
       2: result_exp = a-b;
       3: result_exp = a^b;
        default result_exp = 0;
      endcase
       #10; 
         if (result != result_exp) begin 
           $display ("error "); 
             $stop;
         end 
     end 
     $stop;
    end 
endmodule
