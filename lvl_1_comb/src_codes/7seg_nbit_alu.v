`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 01:37:33 AM
// Design Name: 
// Module Name: Q6_7seg_nbit_alu
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


module Q6_7seg_nbit_alu #(parameter N=4)(
   input [N-1:0] A,B , 
   input [1:0] opcode, 
   input enable,
   output reg a,b,c,d,e,f,g
    );
    wire [N-1:0] alu_result ;
    
    Q5_nbit_alu #(N) alu (A,B,opcode, alu_result);
    
    always @ (*) begin 
     if (enable) begin
       case(alu_result) 
        0: {a,b,c,d,e,f,g} = 'b1111110;
        1: {a,b,c,d,e,f,g} = 'b0110000;
        2: {a,b,c,d,e,f,g} = 'b1101101;
        3: {a,b,c,d,e,f,g} = 'b1111001;
        4: {a,b,c,d,e,f,g} = 'b0110011;
        5: {a,b,c,d,e,f,g} = 'b1011011;
        6: {a,b,c,d,e,f,g} = 'b1011111;
        7: {a,b,c,d,e,f,g} = 'b1110000;
        8: {a,b,c,d,e,f,g} = 'b1111111;
        9: {a,b,c,d,e,f,g} = 'b1111011;
        10: {a,b,c,d,e,f,g} = 'b1110111;
        11: {a,b,c,d,e,f,g} = 'b0011111;
        12: {a,b,c,d,e,f,g} = 'b1001110;
        13: {a,b,c,d,e,f,g} = 'b0111101;
        14: {a,b,c,d,e,f,g} = 'b1001111;
        15: {a,b,c,d,e,f,g} = 'b1000111;
         default: {a,b,c,d,e,f,g} = 0;
       endcase 
     end 
    else {a,b,c,d,e,f,g} = 0;
    end 
endmodule
