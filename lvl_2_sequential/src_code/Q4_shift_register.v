`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2026 12:44:36 PM
// Design Name: 
// Module Name: Q4_shift_register
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


module Q4_shift_register (sclr, sset, shiftin, load, clk, enable, aclr, aset,
data, shiftout, q);
    
 parameter LOAD_AVALUE =1;
 parameter LOAD_SVALUE =1;
 parameter SHIFT_DIRECTION = "LEFT";
 parameter SHIFT_WIDTH =8 ; 
 
input sclr, sset, shiftin, load, clk, enable, aclr, aset; 
input [SHIFT_WIDTH-1:0] data;
output reg shiftout;
output reg [SHIFT_WIDTH-1:0] q;

always @(posedge clk , posedge aclr, posedge aset) begin 
 if (aclr) q <= 0;
 else if (aset) q <= LOAD_AVALUE;
 else begin 
   if (enable)  begin 
     if (sclr) q <= 0;
     else if (sset) q <= LOAD_SVALUE;
     else if (load) q <= data ;
     else if (SHIFT_DIRECTION == "LEFT") begin 
       {shiftout, q} <= {q, shiftin};
     end 
     else if (SHIFT_DIRECTION == "RIHGT")begin 
       {q, shiftout} <= {shiftin, q};
     end 
   end 
 end 
end  
endmodule
