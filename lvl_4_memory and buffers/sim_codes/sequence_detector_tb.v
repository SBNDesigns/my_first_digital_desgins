`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2026 07:30:12 PM
// Design Name: 
// Module Name: sequence_detector_tb
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


module sequence_detector_tb(

    );
    reg clk, rst, Din;
    wire ERR;
    sequence_detector dut (
        .Din(Din),
        .clk(clk),
        .rst(rst),
        .ERR(ERR)
    );
    initial begin
        clk = 0;
        forever #0.1 clk = ~clk; // Clock period of 10 time units
    end
    initial begin
        rst = 1;
        Din = 0;
        @(negedge clk);
        rst = 0;
        repeat (20) begin
            Din = $random % 2; // Randomly generate Din as 0 or 1
            @(negedge clk);
        end
        $stop;
    end
endmodule
