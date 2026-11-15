`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2026 12:02:51 AM
// Design Name: 
// Module Name: FIFO
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


module FIFO(
input clk_a, clk_b, ren_b, wen_a, rst, 
input [FIFO_WIDTH-1:0] din_a,
output reg [FIFO_WIDTH-1:0] dout_b,
output reg full, empty
    );
    parameter FIFO_WIDTH = 16 ;
    parameter FIFO_DEPTH =  512;

    reg [FIFO_WIDTH-1:0] fifo_mem [FIFO_DEPTH-1:0];
    reg [FIFO_DEPTH-1:0] wr_ptr, rd_ptr;
    reg [FIFO_DEPTH-1:0] fifo_count;
    always @(posedge clk_a ) begin
        if(rst) begin
            wr_ptr <= 0;
            fifo_count <= 0;
        end else if(wen_a && !full) begin
            fifo_mem[wr_ptr] <= din_a;
            wr_ptr <= wr_ptr + 1;
            fifo_count <= fifo_count + 1;
        end
    end
    always @(posedge clk_b ) begin
        if(rst) begin
            rd_ptr <= 0;
        end else if(ren_b && !empty) begin
            dout_b <= fifo_mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            fifo_count <= fifo_count - 1;
        end
    end
    always @(*) begin
        full = (fifo_count == FIFO_DEPTH)? 1'b1 : 1'b0;
        empty = (fifo_count == 0)? 1'b1 : 1'b0;
    end
    always @(*) begin 
       if (wr_ptr == 512) wr_ptr =0;
       else if (rd_ptr == 512) rd_ptr = 0;
    end 
endmodule
