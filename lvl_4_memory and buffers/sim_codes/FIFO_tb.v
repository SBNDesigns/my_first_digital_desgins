`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2026 12:13:59 AM
// Design Name: 
// Module Name: FIFO_tb
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


module FIFO_tb(

    );
    parameter FIFO_WIDTH = 16 ;
    parameter FIFO_DEPTH =  512;
    reg clk_a, clk_b, ren_b, wen_a, rst;
    reg [FIFO_WIDTH-1:0] din_a;
    wire [FIFO_WIDTH-1:0] dout_b;
    wire full, empty;

FIFO #(
    .FIFO_WIDTH(FIFO_WIDTH),
    .FIFO_DEPTH(FIFO_DEPTH)
) uut (
    .clk_a(clk_a),
    .clk_b(clk_b),
    .ren_b(ren_b),
    .wen_a(wen_a),
    .rst(rst),
    .din_a(din_a),
    .dout_b(dout_b),
    .full(full),
    .empty(empty)
);
    initial begin
        clk_a = 0;
        clk_b = 0;
        forever begin
            #5 clk_a = ~clk_a;
            #10 clk_b = ~clk_b;
        end
    end
    initial begin
        rst = 1;
        @(negedge clk_a);
        rst = 0;
        ren_b = 0;
        //write operation
        repeat (1000) begin 
           din_a = $random;
           wen_a = 1;
           @(negedge clk_a);
        end 
        //read operation
        wen_a = 0;
        repeat (1000) begin
           ren_b = 1;
           @(negedge clk_b);
        end
        //write and read operation
        wen_a = 1;
        ren_b = 1;
        repeat (1000) begin
           din_a = $random;
           @(negedge clk_a);
          // @(negedge clk_b);
        end
    end 
endmodule
