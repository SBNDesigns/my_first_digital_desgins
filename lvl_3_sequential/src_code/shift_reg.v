`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 01:53:55 PM
// Design Name: 
// Module Name: shift_reg
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


module shift_reg(
clk, rst, load, load_value, PO
    );
    parameter SHIFT_AMOUNT = 1;
    parameter SHIFT_DIRECTION = 1; // 1 for left shift, 0 for right shift
    input clk, rst, load;
    input [7:0] load_value;
    output reg [7:0] PO;

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            PO <= 0;
        end
        else if(load) begin
            PO <= load_value;
        end
        else begin
            if(SHIFT_DIRECTION) begin // Left shift
                PO <= PO << SHIFT_AMOUNT;
            end
            else begin // Right shift
                PO <= PO >> SHIFT_AMOUNT;
            end
        end
    end
endmodule
