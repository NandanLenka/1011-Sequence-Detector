`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 23:20:50
// Design Name: 
// Module Name: mealy_overlapping
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


module mealy_overlapping(
    input clk,
    input reset,
    input x,
    output reg y
    );
    
    parameter S0=3'b000,
              S1=3'b001,
              S2=3'b010,
              S3=3'b011;
              
    reg[2:0] current_state, next_state;
    
    always @(posedge clk or posedge reset) begin
    if(reset)
    current_state <= S0;
    else
    current_state <= next_state;
    end
    
    always @(*) begin
    case (current_state)
    S0: next_state = x ? S1 : S0;
    S1: next_state = x ? S1 : S2;
    S2: next_state = x ? S3 : S0;
    S3: next_state = x ? S1 : S2;
    default: next_state = S0;
    endcase
    end
    
    always @(*) begin 
    case(current_state)
    S3: y = x ? 1 : 0;
    default: y = 0;
    endcase 
    end
endmodule
