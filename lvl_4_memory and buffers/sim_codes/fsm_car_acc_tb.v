`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 06:24:19 PM
// Design Name: 
// Module Name: fsm_car_acc_tb
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


module fsm_car_acc_tb(

    );
    reg clk, rst;
    reg [7:0] car_speed;
    reg [7:0] speed_limit;
    reg [6:0] leading_distance;
    wire unlock_doors;
    wire accelerate_car;

    parameter MIN_DISTANCE = 40;
    parameter STOP = 2'b00;
    parameter ACCELERATE = 2'b01;
    parameter DECELERATE = 2'b11;
    acc_tesla_car_fsm dut (
        .clk(clk),
        .rst(rst),
        .car_speed(car_speed),
        .speed_limit(speed_limit),
        .leading_distance(leading_distance),
        .unlock_doors(unlock_doors),
        .accelerate_car(accelerate_car)
    );
    initial begin
        clk = 0;
        forever #0.1 clk = ~clk; // Clock period of 10 time units
    end
    initial begin
        rst = 1;
        car_speed = 0;
        speed_limit = 60;
        leading_distance = 50;
        @(negedge clk);
        rst = 0;
        repeat (10) begin
            
            $display("Car Speed: %d, Speed Limit: %d, Leading Distance: %d, Unlock Doors: %b, Accelerate Car: %b", 
                      car_speed, speed_limit, leading_distance, unlock_doors, accelerate_car);
            // Update inputs for next iteration
            car_speed = car_speed + 5; // Increase car speed by 5
            leading_distance = leading_distance - 5; // Decrease leading distance by 5
            @(negedge clk);
        end
        $stop;
    end 
endmodule
