`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2026 06:59:54 PM
// Design Name: 
// Module Name: counter_4bit_tb
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


module counter_4bit_tb(

    );
    reg clk, set;
    wire [3:0] out;
    wire [3:0] out_gold;
    Q3_4bit_ripple_counter dut_gold (
        .clk(clk),
        .rstn(set),
        .out(out_gold)
    );
    counter_4bit dut (
        .clk(clk),
        .set(set),
        .out(out)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
      set = 0;
      @(negedge clk);
      set = 1;
        repeat (200) @(negedge clk);
        if(out != out_gold) begin
            $display("Test failed: out should be equal to out_gold");
            $stop;
        end
        $stop;
    end 


endmodule
