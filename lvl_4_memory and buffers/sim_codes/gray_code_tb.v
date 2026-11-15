`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2026 06:15:52 PM
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
    wire [1:0] y;
    wire [1:0] golden_gray;
    gray_code_fsm dut (
        .clk(clk),
        .rst(rst),
        .y(y)
    );
    gray_code golden (
        .clk(clk),
        .rst(rst),
        .gray_out(golden_gray)
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
            //@(negedge clk);
            $display("FSM Output: %b, Golden Output: %b", y, golden_gray);
            if (y !== golden_gray) begin
                $display("Mismatch detected at time %t: FSM Output = %b, Golden Output = %b", $time, y, golden_gray);
            end
            @(negedge clk);
        end
        $stop;
    end
endmodule
