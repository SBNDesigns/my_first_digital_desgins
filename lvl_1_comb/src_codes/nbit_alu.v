`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 01:05:12 AM
// Design Name: 
// Module Name: Q5_nbit_alu
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


module Q5_nbit_alu #(parameter N = 4)(
  input [N-1:0] a,b,
  input [1:0] opcode,
  output reg [N-1:0] result
    );
    wire [N-1:0] half_adder;
    Q4_nbit_adder #(N) uut1 (a , b , half_adder);
    
  always @(*) begin 
    if (opcode =='b00) result = half_adder;
    else if (opcode == 'b10 ) result = a - b ; 
    else if (opcode == 'b01 ) result = a | b ;
    else if (opcode == 'b11 ) result = a ^ b ;
    else result = 0;
  end   
endmodule
