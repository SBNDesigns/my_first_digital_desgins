`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 11:18:34 AM
// Design Name: 
// Module Name: param_adder_tb
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


module param_adder_tb(

    );
    reg [3:0] a, b;
    reg clk, cin, rst;
    wire [3:0] sum;
    wire cout;

    parameterized_adder #(.WIDTH(4), .PIPLINED(1), .USE_FULL_ADDER(1)) dut (
        .a(a),
        .b(b),
        .clk(clk),
        .cin(cin),
        .rst(rst),
        .sum(sum),
        .cout(cout)
    );
    initial begin
        clk = 0;
        forever #0.001 clk = ~clk; // Clock period of 10 time units
    end
    initial begin
        rst = 1;
        a = 0;
        b = 0;
        cin = 0;
        @(negedge clk);
        rst = 0;
        repeat (10) begin
            a = $random  % 16; // Random 4-bit value
            b = $random % 16; // Random 4-bit value
            cin = $random % 2; // Random carry-in (0 or 1)
           // @(negedge clk);
            @(negedge clk); // Wait for two clock cycles to allow the pipelined adder to produce output
            if ({cout, sum} !== (a + b + cin)) begin
                $display("Test failed for a=%d, b=%d, cin=%d: sum=%d, cout=%d", a, b, cin, sum, cout);
            end else begin
                $display("Test passed for a=%d, b=%d, cin=%d: sum=%d, cout=%d", a, b, cin, sum, cout);
            end
            @(negedge clk); // Wait for the next clock cycle before generating new inputs
        end
        $stop;
    end
endmodule
