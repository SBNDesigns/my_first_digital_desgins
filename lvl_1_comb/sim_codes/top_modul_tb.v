`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 01:56:15 AM
// Design Name: 
// Module Name: test6
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


module test6(

    );
    parameter N = 4;
    reg [N-1:0] A,B;
    reg [1:0] opcode;
    reg enable;
    reg [6:0] exp_out;
    wire a,b,c,d,e,f,g;
    wire [N-1:0] alu_result ;
    
    Q6_7seg_nbit_alu #(N) uut (A,B,opcode , enable , a,b,c,d,e,f,g);
    
    Q5_nbit_alu #(N) alu (A,B,opcode, alu_result);
    
    integer i;
    initial begin 
    B = 0; opcode = 0; enable = 1;
       for (i=0; i<16; i=i+1) begin 
         A = i; //i want to test A values only on the 7_seg display
         #3;
          case(alu_result) 
        0: exp_out = 'b1111110;
        1: exp_out = 'b0110000;
        2: exp_out = 'b1101101;
        3: exp_out = 'b1111001;
        4: exp_out = 'b0110011;
        5: exp_out = 'b1011011;
        6: exp_out = 'b1011111;
        7: exp_out = 'b1110000;
        8: exp_out = 'b1111111;
        9: exp_out = 'b1111011;
        10: exp_out = 'b1110111;
        11: exp_out = 'b0011111;
        12: exp_out = 'b1001110;
        13: exp_out = 'b0111101;
        14: exp_out = 'b1001111;
        15: exp_out = 'b1000111;
         default: exp_out = 0;
       endcase
       #10; 
        if ( {a,b,c,d,e,f,g} != exp_out ) begin 
           $display ("error"); $stop; 
           end 
       end 
       $stop;
    end 
endmodule
