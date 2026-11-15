`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 06:45:04 PM
// Design Name: 
// Module Name: Q1_mux
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


module Q1_mux(
input a,b,c,d,e,f,sel,
output out,out_bar
    );
    wire and1,xnor1;
    and(and1,a,b,c);
    xnor(xnor1,d,e,f);
 assign out = (sel)? xnor1: and1;
 assign out_bar = ! out;
endmodule
