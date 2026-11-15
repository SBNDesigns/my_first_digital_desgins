`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2026 07:13:23 PM
// Design Name: 
// Module Name: single_port_ram_tb
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


module single_port_ram_tb(

    );
    parameter MEM_WIDTH = 16;
    parameter MEM_DEPTH = 1024;
    parameter ADDR_SIZE = 10;
    parameter ADDR_PIPLINE = "FALSE";
    parameter DOUT_PIPLINE = "TRUE";
    parameter PARITY_EN = 1;
    reg [MEM_WIDTH-1:0] din;
    reg [ADDR_SIZE-1:0] addr;
    reg wr_en;
    reg rd_en;
    reg blk_select;
    reg addr_en;
    reg dout_en;
    reg clk;
    reg rst;
    wire [MEM_WIDTH-1:0] dout;
    wire  parity_out;

single_port_ram #(
    .MEM_WIDTH(MEM_WIDTH),
    .MEM_DEPTH(MEM_DEPTH),
    .ADDR_SIZE(ADDR_SIZE),
    .ADDR_PIPLINE(ADDR_PIPLINE),
    .DOUT_PIPLINE(DOUT_PIPLINE),
    .PARITY_EN(PARITY_EN)
) uut (
    .din(din),
    .addr(addr),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .blk_select(blk_select),
    .addr_en(addr_en),
    .dout_en(dout_en),
    .clk(clk),
    .rst(rst),
    .dout(dout),
    .parity_out(parity_out)
);
   integer i;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end
    initial begin
        // Initialize Inputs
        din = 0;
        addr = 0;
        wr_en = 0;
        rd_en = 0;
        blk_select = 0;
        addr_en = 0;
        dout_en = 0;
        clk = 0;
        rst = 1;
        // Wait for global reset to finish
        @(negedge clk);
        rst = 0;
       for(i = 0; i < 1023; i = i + 1) begin
            //@(negedge clk);
            din = $random;
            addr = i % MEM_DEPTH;
            wr_en = 1;
            blk_select = 1;
            addr_en = 1;
            dout_en = 0;
            @(negedge clk);
        end

       for(i = 0; i < 1023; i = i + 1) begin
            //@(negedge clk);
            addr = i % MEM_DEPTH;
            wr_en = 0;
            rd_en = 1;
            blk_select = 1;
            addr_en = 1;
            dout_en = 1;
            @(negedge clk);
        end

        for(i = 0; i < 10000; i = i + 1) begin
            //@(negedge clk);
            addr = $random;
            din = $random;
            wr_en = 1;
            rd_en = 1;
            blk_select = $random;
            addr_en = 1;
            dout_en = 1;
            @(negedge clk);
        end
        $stop;
    end 
    endmodule
    
