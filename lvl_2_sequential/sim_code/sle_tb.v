`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2026 11:41:48 PM
// Design Name: 
// Module Name: sle_tb
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


module sle_tb(

    );
    reg D, clk, en, ALn, ADn, SLn , SD, LAT;
    wire Q;
    Q5_sle uut(
    .D(D),
    .clk(clk),
    .en(en),
    .ALn(ALn),
    .ADn(ADn),
    .SLn(SLn),
    .SD(SD),
    .LAT(LAT),
    .Q(Q)
    );
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
    initial begin
    D = 0; en = 0; ALn = 0; ADn
    = 1; SLn = 1; SD = 0; LAT = 0;
    @(negedge clk); 
    ALn = 1; // Asynchronous Reset
     repeat(1000) begin 
        D = $random; en = $random;   SLn = $random; 
        SD = $random; LAT = $random;
        @(negedge clk);
      end 
    ALn = 0; // Asynchronous Reset
   repeat (100) @(negedge clk);

      $stop;
    end
endmodule
