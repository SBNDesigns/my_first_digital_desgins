`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2026 07:09:43 PM
// Design Name: 
// Module Name: sequence_detector
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


module sequence_detector(
    Din, clk, rst, ERR
    );
    input Din, clk, rst;
    output  ERR;
    parameter Start = 2'b00;
    parameter D0_is_1 = 2'b01;
    parameter D1_is_1 = 2'b10;
    parameter D0_not_1 = 2'b11;
    parameter D1_not_1 = 3'b100;

    reg [2:0] current_state, next_state;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            current_state <= Start;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case(current_state) //Mealy FSM
            Start: begin
                if(Din) begin
                    next_state = D0_is_1;
                end
                else begin
                    next_state = D0_not_1;
                end
            end
            D0_is_1: begin
                if(Din) begin
                    next_state = D1_is_1;
                end
                else begin
                    next_state = D1_not_1;
                end
               
            end
            D1_is_1: begin
                next_state = Start;
            end
            D0_not_1: begin
                
               next_state = D1_not_1;
            end
            D1_not_1: begin
               
                next_state = Start;
            end

        endcase

    end

    assign ERR = (current_state == D1_is_1 && Din == 1'b1) ? 1'b1 : 1'b0;
endmodule
