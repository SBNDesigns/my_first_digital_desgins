`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 05:50:10 PM
// Design Name: 
// Module Name: gray_code_tb
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


module gray_code_tb(

    );
    reg clk, rst;
    wire [1:0] gray_out;
    gray_code dut (
        .clk(clk),
        .rst(rst),
        .gray_out(gray_out)
    );
    initial begin
        clk = 0;
        forever #0.1 clk = ~clk; // Clock period of 10 time units
    end
    initial begin
        rst = 1;
        @(negedge clk);
        rst = 0;
        repeat (10) begin
            @(negedge clk);
            $display("Gray Code Output: %b", gray_out);
        end
        $stop;
    end
endmodule
