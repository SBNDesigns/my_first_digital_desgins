`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 12:49:22 AM
// Design Name: 
// Module Name: Q4_nbit_adder_tb
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


module Q4_nbit_adder_tb(

    );
    parameter N =3;
    reg [N-1:0] a,b;
    wire [N-1:0] c;
    reg  [N-1:0] c_expected;
    Q4_nbit_adder #(3) uut (a,b,c);
    
    initial begin 
     repeat (30) begin 
       a = $random; b = $random;
       #2; 
       c_expected = a + b ; 
       #10; 
       if (c != c_expected) begin $display (" error "); $stop; end 
     end 
     $stop;
    end 
endmodule
