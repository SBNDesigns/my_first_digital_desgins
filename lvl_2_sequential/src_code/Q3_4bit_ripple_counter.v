`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2026 12:08:48 PM
// Design Name: 
// Module Name: Q3_4bit_ripple_counter
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


module Q3_4bit_ripple_counter(
  input clk, rstn,
  output [3:0] out
    );
    wire qn0,qn1,qn2,qn3;
    wire q0 , q1, q2, q3;
    
   Q2_B_asyn_dff M1 (.d(qn0), .rstn(rstn), .clk(clk), .q(q0), .qbar(qn0));
   
   Q2_B_asyn_dff M2 (.d(qn1), .rstn(rstn), .clk(q0), .q(q1), .qbar(qn1));
   
   Q2_B_asyn_dff M3 (.d(qn2), .rstn(rstn), .clk(q1), .q(q2), .qbar(qn2));
   
   Q2_B_asyn_dff M4 (.d(qn3), .rstn(rstn), .clk(q2), .q(q3), .qbar(qn3));

    assign out = {qn3, qn2, qn1, qn0};
endmodule
