`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 07:46:27 AM
// Design Name: 
// Module Name: DSP_tb
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


module DSP_tb(

    );
    reg [17:0] A, B, D;
    reg [47:0] C;
    reg clk, rst_n;
    wire [47:0] P;
    parameter OPERATION = "ADD" ;
    DSP #(.OPERATION(OPERATION)) dut(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .clk(clk),
        .rst_n(rst_n),
        .P(P)
    );
    initial begin
        clk = 0;
    forever #5 clk = ~clk;
    end
    initial begin
        rst_n = 0;
        @(negedge clk) rst_n = 1;
        repeat (100) begin 
           A = $random;
           B = $random;
           C = $random;
           D = $random;
           @(negedge clk);
        end 
    end
endmodule
