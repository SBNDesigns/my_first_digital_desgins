`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2026 12:23:06 PM
// Design Name: 
// Module Name: Q3_tb
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


module Q3_tb(

    );
    reg clk, rstn;
    wire [3:0] out;
    
    Q3_4bit_ripple_counter uut (.clk(clk) , .rstn(rstn), .out(out));
    
    initial begin 
     clk=0;
     forever begin 
      #5 clk = ~clk;
     end 
    end 
    integer i;
    initial begin 
     rstn = 0;
     @(negedge clk);
      for (i=0; i< 1000; i=i+1) begin 
        if(i<200) rstn = 1;
        else if (i<500 ) rstn =0;
        else if (i<800 ) rstn = 1;
        else if (i< 1000 ) rstn= 0;
        else rstn=1;
        @(negedge clk);
      end 
      $stop;
    end 
endmodule
