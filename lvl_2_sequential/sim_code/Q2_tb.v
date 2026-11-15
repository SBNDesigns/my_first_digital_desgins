`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 07:29:34 PM
// Design Name: 
// Module Name: Q2_tb
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


module Q2_tb(

    );
    parameter FF_TYPE = "DFF";
    reg d, rstn, clk;
    wire q , qbar , q_gold, qbar_gold;
    
    Q2_C #("DFF") uut (d, rstn , clk, q, qbar );
    generate 
     if (FF_TYPE == "DFF")  Q2_B_asyn_dff M1 (d, rstn, clk, q_gold, qbar_gold);
     else if (FF_TYPE == "TFF") Q2_A_tff M2 ( d, rstn , clk , q_gold , qbar_gold);
    endgenerate 
   
    initial begin 
      clk = 0;
      forever begin 
       #5 clk = ~clk;
      end 
    end 
     
   initial begin 
     d = 1; rstn = 0; 
     @(negedge clk);
     rstn = 1;
    // @(negedge clk);
     repeat (1000) begin 
      d = $random;
      @(negedge clk);
       if (q != q_gold ) begin 
         $display ("error "); $stop;
       end 
     end
     $stop; 
   end 
endmodule
