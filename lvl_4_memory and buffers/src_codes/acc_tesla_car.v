`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 06:05:46 PM
// Design Name: 
// Module Name: acc_tesla_car
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


module acc_tesla_car_fsm(
  speed_limit, car_speed, leading_distance, clk, rst, unlock_doors, accelerate_car
    );
    parameter MIN_DISTANCE = 40;
    parameter STOP = 2'b00;
    parameter ACCELERATE = 2'b01;
    parameter DECELERATE = 2'b11; 
    input [7:0]speed_limit;
    input [7:0]car_speed;
    input [6:0]leading_distance;
    input clk, rst;
    output reg unlock_doors;
    output reg accelerate_car;

    reg [1:0] current_state, next_state;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            current_state <= STOP;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case(current_state)
            STOP: begin
                unlock_doors = 1;
                accelerate_car = 0;
                if(leading_distance >= MIN_DISTANCE) begin
                    next_state = ACCELERATE;
                end
                else begin
                    next_state = STOP;
                end
            end
            ACCELERATE: begin
                unlock_doors = 0;
                accelerate_car = 1;
                if(car_speed > speed_limit || leading_distance < MIN_DISTANCE) begin
                    next_state = DECELERATE;
                end
                else begin
                    next_state = ACCELERATE;
                end
            end
            DECELERATE: begin
                unlock_doors = 0;
                accelerate_car = 0;
                if(car_speed < speed_limit && leading_distance >= MIN_DISTANCE) begin
                    next_state = ACCELERATE;
                end
                else begin
                    next_state = DECELERATE;
                end
            end
            default: begin
                unlock_doors = 1;
                accelerate_car = 0;
                next_state = STOP;
            end
        endcase
    end

    
    endmodule
