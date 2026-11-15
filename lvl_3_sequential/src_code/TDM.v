`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 07:52:54 AM
// Design Name: 
// Module Name: TDM
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


module TDM(
in0, in1, in2, in3, clk, rst, out
    );
    input [1:0] in0, in1, in2, in3;
    input clk, rst;
    output reg [1:0] out;
    reg [1:0] sel;
    //reg [1:0] counter;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            sel <= 0;
        end
        else begin
                sel <= sel + 1;
        end
    end
    always @(*) begin
        case(sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = 0;
        endcase
    end
endmodule
