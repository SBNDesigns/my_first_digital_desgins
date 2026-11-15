`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 09:31:55 AM
// Design Name: 
// Module Name: LFSR_tb
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


module LFSR_tb(

    );
    reg clk, rst, set;
    wire [3:0] out;
    LFSR dut(
        .clk(clk),
        .rst(rst),
        .set(set),
        .out(out)
    );
    initial begin
        clk = 0;
    forever #5 clk = ~clk;
    end
    initial begin
        rst = 1;
        set = 1;
        @(negedge clk) 
        if (out !== 4'b0001) begin
            $display("Test failed: out = %b, expected = %b", out, 4'b0001);
            $stop;
        end
        rst = 0;
        set = 0;
        repeat (100) begin
           @(negedge clk);
        end
        $display("Test completed successfully.");
        $stop;
    end
endmodule
