`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 12:07:00 PM
// Design Name: 
// Module Name: Q4_onebit_alu
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


module Q4_onebit_alu(
input a,b,ainvert,binvert,carryin,
input [1:0] operation,
output carryout,result
    );
    wire a_out,b_out,sum;
    assign a_out = (ainvert)? !a:a;
    assign b_out = (binvert)? !b:b;
    assign {carryout,sum} = carryin + a_out +b_out;
    assign result = (operation==0)? a_out&b_out:
                    (operation==1)? a_out^b_out:
                    (operation==2)? sum:0;
endmodule
