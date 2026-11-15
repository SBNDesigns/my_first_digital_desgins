`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 04:58:21 PM
// Design Name: 
// Module Name: combin_q1
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


module combin_q1(
 input [2:0] d,
 input a, b, c, sel,
 output out, out_bar
    );
    and(and1,d[0],d[1]);
    or(or1,and1,d[2]);
    xnor(xnor1,a,b,c);
    
    assign out = (sel)? or1 : xnor1;
    assign out_bar = !out;
endmodule
