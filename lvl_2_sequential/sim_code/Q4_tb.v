`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2026 12:27:21 PM
// Design Name: 
// Module Name: Q4_tb
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


module Q4_tb(

    );
    parameter LOAD_AVALUE = 2;
    parameter LOAD_SVALUE = 4;
    parameter SHIFT_DIRECTION = "LEFT";
    parameter SHIFT_WIDTH = 8; 
    
reg sclr, sset, shiftin, load, clk, enable, aclr, aset; 
reg [SHIFT_WIDTH-1:0] data;
wire shiftout;
wire [SHIFT_WIDTH-1:0] q;
Q4_shift_register #(2,4,"LEFT", 8) uut (sclr, sset, shiftin, load, clk, enable, aclr, aset,
data, shiftout, q);
initial begin 
 clk =0;
 forever begin 
   #5 clk = ~clk;
 end 
end 

initial begin 
 aclr =1 ; aset = 1; //1
 repeat (1000) begin 
   sclr = $random;
   shiftin = $random;
   sset = $random;
   data = $random;
   load = $random;
   enable = $random;
   @(negedge clk);
   
   if (q !=0) begin 
     $display ("the operation of asyn_clear is not correct ");
     $stop;
   end 
 end
 
 aclr =0; aset = 1; //2
 repeat (1000) begin 
   sclr = $random;
   shiftin = $random;
   sset = $random;
   data = $random;
   load = $random;
   enable = $random;
   @(negedge clk);
   
   if (q != LOAD_AVALUE) begin 
     $display ("the operation of asyn_SET is not correct ");
     $stop;
   end 
 end
 aclr =0; aset = 0; //3
 sset=1; sclr =1 ; 
 repeat (1000) begin 
   shiftin = $random;
   data = $random;
   load = $random;
   enable = $random;
   @(negedge clk);
   
   if (q != 0) begin 
     $display ("the operation of sync_clr is not correct ");
     $stop;
   end 
end 
aclr =0; aset = 0; //4
 sset=1; sclr =0 ;
 repeat (1000) begin 
   shiftin = $random;
   data = $random;
   load = $random;
   enable = $random;
   @(negedge clk);
   
   if (q != 4) begin 
     $display ("the operation of sync_set is not correct ");
     $stop;
   end 
end 
aclr =0; aset = 0; //5
 sset=0; sclr =0 ;
 load = 1;
  repeat (1000) begin 
   shiftin = $random;
   data = $random;
  // load = $random;
   enable = 1;
   @(negedge clk);
   
   if (q != data) begin 
     $display ("the operation of LOAD is not correct ");
     $stop;
   end 
end
 aclr =0; aset = 0; //6
 sset=0; sclr =0 ;
 load = 0;
  repeat (1000) begin 
   shiftin = 1;
   data = 8'b00000000;
  // load = $random;
   enable = 1;
   @(negedge clk);
   
   end
   $stop;
end 
endmodule
