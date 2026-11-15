`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2026 06:11:38 PM
// Design Name: 
// Module Name: gray_code
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


module gray_code_fsm(
 clk, rst, y
    );
    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;
    input clk, rst;
    output reg [1:0] y;
    reg [1:0] current_state, next_state;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            current_state <= 2'b00;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case(current_state)
            A: begin
                y = 2'b00;
                next_state = B;
            end
            B: begin
                y = 2'b01;
                next_state = C;
            end
            C: begin
                y = 2'b11;
                next_state = D;
            end
            D: begin
                y = 2'b10;
                next_state = A;
            end
            default: begin
                y = 2'b00;
                next_state = A;
            end
        endcase
    end
endmodule
