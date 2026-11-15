`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2026 02:14:10 PM
// Design Name: 
// Module Name: single_port_ram
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


module single_port_ram(
    input [MEM_WIDTH-1:0] din,
    input [ADDR_SIZE-1:0] addr,
    input wr_en,
    input rd_en,
    input blk_select,
    input addr_en,
    input dout_en,
    input clk,
    input rst,
    output reg [MEM_WIDTH-1:0] dout,
    output   parity_out
    );
    parameter MEM_WIDTH = 16;
    parameter MEM_DEPTH = 1024;
    parameter ADDR_SIZE = 10;
    parameter ADDR_PIPLINE = "FALSE";
    parameter DOUT_PIPLINE = "TRUE";
    parameter PARITY_EN = 1;

    reg [MEM_WIDTH-1:0] mem [MEM_DEPTH-1:0];

    reg [ADDR_SIZE-1:0] addr_reg, addr_in;
    reg [MEM_WIDTH-1:0] dout_stg1, dout_stg2;
    

    always @(posedge clk) begin // ram read and write operations
        if (rst) begin
            //dout <= 0;
           // parity_out <= 0;
            addr_reg <= 0;
            dout_stg1 <= 0;
            dout_stg2 <= 0;
        end  else begin
             if (addr_en) begin
                addr_reg <= addr;
            end
             if (dout_en) begin
                dout_stg2 <= dout_stg1;
            end
             if (blk_select) begin
                if (wr_en ) begin
                    mem[addr_in] <= din;
                end
                if (rd_en ) begin
                    dout_stg1 <= mem[addr_in];
                    //parity_out <= ^mem[addr_in]; // Calculate parity for the read data
                end
        end 
        end 
    end
    assign parity_out = (PARITY_EN) ? ^dout : 1'b0; // Calculate parity for the output data if enabled
    // Optional: Add pipelining for address and data output if specified
   always @(*) begin 
     if (ADDR_PIPLINE == "TRUE") begin
        addr_in = addr_reg;
     end else begin
        addr_in = addr;
     end
   end 

   always @(*) begin 
     if (DOUT_PIPLINE == "TRUE") begin
        dout = dout_stg2;
     end else begin
        dout = dout_stg1;
     end
   end
endmodule
