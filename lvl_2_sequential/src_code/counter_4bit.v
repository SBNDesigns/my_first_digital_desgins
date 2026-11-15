`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2026 06:47:44 PM
// Design Name: 
// Module Name: counter_4bit
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


module counter_4bit(clk , set, out );
    input clk, set;
    output reg [3:0] out;
    
    always @(posedge clk or negedge set) begin
       // out <= 0;
        if(!set) begin
            out <= 4'b1111;
        end else begin
            out <= out + 1;
        end
    end
endmodule
