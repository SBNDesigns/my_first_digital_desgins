`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 04:45:28 PM
// Design Name: 
// Module Name: shift_reg_tb
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


module shift_reg_tb(

    );
    reg clk, rst, load;
    reg [7:0] load_value;
    wire [7:0] PO;
    parameter SHIFT_AMOUNT = 4;
    parameter SHIFT_DIRECTION = 0; // 1 for left shift, 0 for right
    shift_reg #(.SHIFT_AMOUNT(SHIFT_AMOUNT), .SHIFT_DIRECTION(SHIFT_DIRECTION)) 
    dut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .load_value(load_value),
        .PO(PO)
    );
    initial begin
        clk = 0;
        forever #0.01 clk = ~clk; // Clock period of 10 time units
    end
    initial begin
        rst = 1;
        load = 0;
        load_value = 8'b10101010;
        @(negedge clk);
        rst = 0;
        @(negedge clk);
        load = 1;
        @(negedge clk);
        load = 0;
        repeat (10) begin
            @(negedge clk);
            $display("PO: %b", PO);
        end
        $stop;
    end 
endmodule
