`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 03:48:37 PM
// Design Name: 
// Module Name: Q1_Latch_tb
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


module Q1_Latch_tb(

    );
    parameter LAT_WIDTH = 4;
    reg aset, gate, aclr;
    reg [LAT_WIDTH-1:0] data;
    wire [LAT_WIDTH-1:0] q;
    reg [LAT_WIDTH-1:0] q_temp;
     
    Q1_latch #(.LAT_WIDTH(LAT_WIDTH)) dut (
        .aset(aset),
        .data(data),
        .gate(gate),
        .aclr(aclr),
        .q(q)
    );
    initial begin
        aset = 1;
        gate = 0;
        aclr = 1;
        data = 0;
        #1;
        if(q != {LAT_WIDTH{1'b0}}) begin
            $display("Test failed: q should be 0 when aclr is high");
        end 
     aclr = 0;
       #1;
       if(q != {LAT_WIDTH{1'b1}}) begin
            $display("Test failed: q should be 1 when aset is high and aclr is low");
        end
    aset = 0;
      #1;
        repeat (100) begin 
          q_temp = q;
          data = $random;
          gate = $random;
          #1;
          if ((gate == 1 && q != data) || (gate == 0 && q != q_temp)) begin
              $display("Test failed: q should be equal to data when gate is high and equal to previous value when gate is low");
              $stop;
          end
        end 
        $stop;
    end
endmodule
