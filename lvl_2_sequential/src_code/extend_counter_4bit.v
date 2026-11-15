`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2026 07:24:34 PM
// Design Name: 
// Module Name: extend_counter_4bit
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


module extend_counter_4bit(clk, set, out, div_2, div_4);
     input clk, set;
    output reg [3:0] out;
    output div_2, div_4;
    
    always @(posedge clk or negedge set) begin
       // out <= 0;
        if(!set) begin
            out <= 4'b1111;
        end else begin
            out <= out + 1;
        end
    end
    assign div_2 = out[0];
    assign div_4 = out[1]; 
endmodule
