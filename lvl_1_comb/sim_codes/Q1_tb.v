`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 05:05:48 PM
// Design Name: 
// Module Name: Q1_tb
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


module Q1_tb(

    );
    reg [2:0]d;
    reg a,b,c,sel;
    wire out, out_bar;
    
    combin_q1 uut (d,a,b,c,sel,out,out_bar);
    
    initial begin 
    repeat (40) begin
    d= $random;
    a= $random;
    b= $random; c= $random; sel=$random;
    
    #10;
    end  
    $stop; 
    
    end 
endmodule
