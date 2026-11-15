`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2026 07:30:03 PM
// Design Name: 
// Module Name: extend_counter_tb
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


module extend_counter_tb();

    reg clk, set;
    wire [3:0] out;
    //wire [3:0] out_gold;
    wire div_2, div_4;
    //Q3_4bit_ripple_counter dut_gold (
    //    .clk(clk),
    //    .rstn(set),
    //    .out(out_gold)
    //);
    extend_counter_4bit dut (
        .clk(clk),
        .set(set),
        .out(out),
        .div_2(div_2),
        .div_4(div_4)
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
        if(div_2 != out[0] || div_4 != out[1]) begin
            $display("Test failed: div_2 or div_4 is not equal to the corresponding bits in out");
            $stop;
        end
        $stop;
    end
endmodule
