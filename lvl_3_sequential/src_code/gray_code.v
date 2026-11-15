`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 04:59:07 PM
// Design Name: 
// Module Name: gray_code
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


module gray_code(
  clk, rst, gray_out
    );
    input clk, rst;
    output  [1:0] gray_out;
   
    reg [1:0] binary_count;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            binary_count <= 0;
        end
        else begin
            binary_count <= binary_count + 1;
        end
    end
    assign gray_out = binary_count ^ (binary_count >> 1);
endmodule
