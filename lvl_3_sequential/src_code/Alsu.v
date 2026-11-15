`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2026 10:57:05 PM
// Design Name: 
// Module Name: Alsu
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


module Alsu( clk, rst, A, B, cin, serial_in, red_op_A, red_op_B, opcode, bypass_A, bypass_B, direction,out , leds);
    input clk, rst;
    input [2:0] A, B, opcode;
    input cin, serial_in;
    input red_op_A, red_op_B;
    input bypass_A, bypass_B, direction;
    output reg [5:0] out;
    output reg [15:0] leds;
    
    parameter INPUT_PRIORITY = "A" ;
    parameter FULL_ADDER = "ON" ;
    
    reg cin_reg, serial_in_reg, red_op_A_reg, red_op_B_reg, bypass_A_reg, bypass_B_reg, direction_reg;
    reg [2:0] A_reg, B_reg, opcode_reg;
    wire invalid_opcode;
    wire invalid_red_op;
    wire invalid;
    assign invalid_opcode = opcode_reg [2] & opcode_reg [1];
    assign invalid_red_op = (red_op_A_reg | red_op_B_reg) & (opcode_reg [2] | opcode_reg [1]);
    assign invalid = invalid_opcode | invalid_red_op;
    //Registering inputs
    always @(posedge clk , posedge rst) begin
       if (rst) begin
          A_reg <= 0;
          B_reg <= 0;
          cin_reg <= 0;
          serial_in_reg <= 0;
          red_op_A_reg <= 0;
          red_op_B_reg <= 0;
          bypass_A_reg <= 0;
          bypass_B_reg <= 0;
          direction_reg <= 0;
          opcode_reg <= 0;
       end else begin
          A_reg <= A;
          B_reg <= B;
          cin_reg <= cin;
          serial_in_reg <= serial_in;
          red_op_A_reg <= red_op_A;
          red_op_B_reg <= red_op_B;
          bypass_A_reg <= bypass_A;
          bypass_B_reg <= bypass_B;
          direction_reg <= direction;
          opcode_reg <= opcode; 
       end
    end
    //LEDs operation
    always @( posedge clk , posedge rst)begin 
       if (rst) begin
          leds <= 0;
       end else if (invalid) begin
          leds <= ~leds;
       end
        else leds <= leds;
    end
    //ALU operations
    always @( posedge clk , posedge rst)begin 
       if (rst) out <= 0;
       else begin
         if (bypass_A_reg && bypass_B_reg ) begin 
            out <= (INPUT_PRIORITY == "A") ? A_reg : B_reg; 
         end else if (bypass_A_reg) begin
            out <= A_reg;
         end else if (bypass_B_reg) begin
            out <= B_reg;
         end else begin 
          case (opcode)
            3'b000: begin 
                    if (red_op_A_reg && red_op_B_reg) begin
                        out <= (INPUT_PRIORITY == "A") ? &A_reg : &B_reg; 
                    end else if (red_op_A_reg) begin
                        out <= &A_reg;
                    end else if (red_op_B_reg) begin
                        out <= &B_reg;
                    end else begin
                        out <= A_reg & B_reg;
                    end
            end 
            3'b001: begin 
                    if (red_op_A_reg && red_op_B_reg) begin
                        out <= (INPUT_PRIORITY == "A") ? ^A_reg : ^B_reg; 
                    end else if (red_op_A_reg) begin
                        out <= ^A_reg;
                    end else if (red_op_B_reg) begin
                        out <= ^B_reg;
                    end else begin
                        out <= A_reg ^ B_reg;
                    end
            end
            3'b010: begin 
                    if (FULL_ADDER == "ON") begin
                        out <= A_reg + B_reg + cin_reg;
                    end else begin
                        out <= A_reg + B_reg;
                    end
            end 
            3'b011: begin 
                   out <= A_reg * B_reg;
            end 
            3'b100: begin 
                   if (direction_reg == 1) begin
                        out <= {out[4:0], serial_in_reg};
                   end else begin
                        out <= {serial_in_reg, out[5:1]};
                   end
            end
            3'b101: begin 
                   if (direction_reg == 1) begin
                        out <= {out[4:0], out[5]};
                   end else begin
                        out <= {out[0], out[5:1]};
                   end
            end 
            default: begin
                   out <= out;
            end
            endcase
       end 
    end 
 end 
endmodule
