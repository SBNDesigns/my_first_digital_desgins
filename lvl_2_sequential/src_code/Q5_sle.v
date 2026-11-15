`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2026 11:56:55 PM
// Design Name: 
// Module Name: Q5_sle
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


module Q5_sle(
D, clk, en, ALn, ADn, SLn , SD, LAT, Q
    );
   input D, clk, en, ALn, ADn, SLn, SD, LAT;
   output  Q;
   reg Q_ff , Q_latch;
   always @(posedge clk , negedge ADn , negedge ALn) begin 
     if (!ALn) Q_ff <= ~ADn;
     else if (en) begin 
       if (SLn) Q_ff <= SD;
        else Q_ff <= D;
     end 
   end      
   always @(*) begin 
     if (!ALn) Q_latch <= ~ADn;     
     else if (clk) begin 
       if (en)begin 
          if (SLn) Q_latch <= SD;
            else Q_latch <= D;
       end 
     end 
   end 

   assign Q = (LAT) ? Q_latch : Q_ff;
endmodule
