`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2026 03:42:14 AM
// Design Name: 
// Module Name: alsu_tb
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


module alsu_tb();
    reg clk, rst;
    reg [2:0] A, B, opcode;
    reg cin, serial_in;
    reg red_op_A, red_op_B;
    reg bypass_A, bypass_B, direction;
    wire [5:0] out;
    wire [15:0] leds;
    Alsu Dut(
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .cin(cin),
        .serial_in(serial_in),
        .red_op_A(red_op_A),
        .red_op_B(red_op_B),
        .opcode(opcode),
        .bypass_A(bypass_A),
        .bypass_B(bypass_B),
        .direction(direction),
        .out(out),
        .leds(leds)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    integer i; 
    initial begin
       // integer i;
        rst = 1; //verify reset functionality
        A = 3'b000;
        B = 3'b000;
        cin = 0;
        serial_in = 0;
        red_op_A = 0;
        red_op_B = 0;
        bypass_A = 0;
        bypass_B = 0;
        direction = 0;
        opcode = 3'b000;
        @(posedge clk);
        if(leds !== 16'b0000000000000000 || out !== 6'b000000) begin 
             $display("Test failed: leds should be 0 after reset");
        $stop; 
        end 
        rst = 0;
        bypass_A = 1; //verify bypass functionality
        bypass_B = 1;
        for (i = 0; i < 100; i = i + 1) begin 
        A = $random;
        B = $random;
        opcode = $urandom_range(0, 5);
         repeat (2) @(posedge clk);
         if (out !== A ) begin 
             $display("Test failed: out should be equal to A when bypass_A is 1");
                $stop;
        end
        end 
        //verify opcode 0 functionality
        bypass_A = 0;
        bypass_B = 0;
        opcode = 3'b000;
        for (i = 0; i < 100; i = i + 1) begin
        A = $random;
        B = $random; 
        red_op_A = $random;
        red_op_B = $random;
        repeat (2) @(posedge clk);
        casex ({red_op_A, red_op_B})
            2'b00: if (out !== (A & B)) begin 
                $display("Test failed: out should be equal to A & B when opcode is 0 and no reduction operation");
                    $stop;
        end
            2'b01: if (out !== & B ) begin 
                $display("Test failed: out should be equal to reduction AND of B when opcode is 0 and red_op_B is 1");
                    $stop;
        end
            2'b1x: if (out !== & A ) begin 
                $display("Test failed: out should be equal to reduction AND of A when opcode is 0 and red_op_A is 1");
                    $stop;
        end
            
        endcase
        end 
        // verify opcode 1 functionality
        opcode = 3'b001;
        for (i = 0; i < 100; i = i + 1) begin
        A = $random;
        B = $random;
        red_op_A = $random;
        red_op_B = $random;
        repeat (2) @(posedge clk);
        casex ({red_op_A, red_op_B})
            2'b00: if (out !== (A ^ B)) begin 
                $display("Test failed: out should be equal to A ^ B when opcode is 1 and no reduction operation");
                    $stop;
        end
            2'b01: if (out !== ^ B ) begin 
                $display("Test failed: out should be equal to reduction XOR of B when opcode is 1 and red_op_B is 1");
                    $stop;
        end
            2'b1x: if (out !== ^ A ) begin 
                $display("Test failed: out should be equal to reduction XOR of A when opcode is 1 and red_op_A is 1");
                    $stop;
        end 
        endcase
        end
        // verify opcode 2 functionality
        opcode = 3'b010;
        red_op_A = 0;
        red_op_B = 0;
        for (i = 0; i < 100; i = i + 1) begin
        A = $random;
        B = $random;
        cin = $random;
        repeat (2) @(posedge clk);
        if (out !== A + B + cin ) begin 
                $display("Test failed: out should be equal to A + B + cin when opcode is 2");
                    $stop;
        end
        end 
        // verify opcode 3 functionality
        opcode = 3'b011;
        for (i = 0; i < 100; i = i + 1) begin
        A = $random;
        B = $random;
        repeat (2) @(posedge clk);
        if (out !== A * B ) begin 
                $display("Test failed: out should be equal to A * B when opcode is 3");
                    $stop;
        end
        end 
        // verify opcode 4 functionality
        opcode = 3'b100;
        for (i = 0; i < 100; i = i + 1) begin
        serial_in = $random;
        A = $random;
        B = $random;
        direction = $random;
        repeat (2) @(posedge clk);
        end 
        // verify opcode 5 functionality
        opcode = 3'b101;
        for (i = 0; i < 100; i = i + 1) begin
        A = $random;
        B = $random;
        direction = $random;
        repeat (2) @(posedge clk);
        end
        $display("All tests passed");
        $stop;
    end
    
endmodule
