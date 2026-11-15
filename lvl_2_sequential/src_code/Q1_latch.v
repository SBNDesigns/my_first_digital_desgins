`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 03:40:44 PM
// Design Name: 
// Module Name: Q1_latch
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


module Q1_latch(
aset, data, gate, aclr, q
    );
    parameter LAT_WIDTH = 1;
    input aset, gate, aclr;
    input [LAT_WIDTH-1:0] data;
    output reg [LAT_WIDTH-1:0] q;

    always @( * ) begin 
       if(aclr) begin
          q <= 0;
       end else if(aset) begin
          q <= {LAT_WIDTH{1'b1}};
       end else if(gate) begin
          q <= data;
       end
    end 
endmodule
