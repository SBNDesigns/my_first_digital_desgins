`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 09:17:39 AM
// Design Name: 
// Module Name: LFSR
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


module LFSR(
   clk, rst, set, out
    );
    input clk, rst, set;
    output [3:0] out;

    reg q1, q2, q3, q4;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            q2 <= 0;
            q3 <= 0;
            q4 <= 0;
        end
        else begin 
           q2 <= q1 ^ q4;
           q3 <= q2;
           q4 <= q3;
        end 
    end

    always @(posedge clk , posedge set) begin
        if(set) begin
            q1 <= 1;
        end
        else begin
            q1 <= q4;
        end
    end
     assign out = {q4, q3, q2, q1};
endmodule
