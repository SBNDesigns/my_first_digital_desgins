`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 08:00:40 AM
// Design Name: 
// Module Name: TDM_tb
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


module TDM_tb(

    );
    reg [1:0] in0, in1, in2, in3;
    reg clk, rst;
    wire [1:0] out;

    reg [1:0] counter;
    TDM dut(
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .clk(clk),
        .rst(rst),
        .out(out)
    );
    initial begin
        clk = 0;
    forever #5 clk = ~clk;
    end
    initial begin
        rst = 1;
        in0 = 0;
        in1 = 0;
        in2 = 0;
        in3 = 0;
        counter = 0;
        @(negedge clk) rst = 0;
        if (out !== in0) begin
            $display("Test failed: out = %b, expected = %b", out, in0);
            $stop;
        end
        repeat (100) begin
           in0 = $random;
           in1 = $random;
           in2 = $random;
           in3 = $random;
           counter = counter + 1;
              @(negedge clk);
              case(counter)
                2'b00: if (out !== in0) begin
                    $display("Test failed: out = %b, expected = %b", out, in0);
                    $stop;
                end
                2'b01: if (out !== in1) begin
                    $display("Test failed: out = %b, expected = %b", out, in1);
                    $stop;
                end
                2'b10: if (out !== in2) begin
                    $display("Test failed: out = %b, expected = %b", out, in2);
                    $stop;
                end
                2'b11: if (out !== in3) begin
                    $display("Test failed: out = %b, expected = %b", out, in3);
                    $stop;
                end
              endcase
        end
        $stop;
    end
endmodule
