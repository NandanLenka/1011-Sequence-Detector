`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 23:01:15
// Design Name: 
// Module Name: testbench_moore_nonoverlapping
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


module testbench_moore_nonoverlapping();
    reg clk,reset,x;
    wire y;
    
    moore_nonoverlapping uut(.clk(clk), .reset(reset), .x(x), .y(y));
    
    always #5 clk = ~clk;
    
    initial begin
    clk = 0;
    reset = 1;
    x = 0;
    #10;
    reset = 0;
            
    // Input Sequence: 1011011
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10; 
        
    $finish;
    end
        
    initial begin 
    $monitor("Time = %d | x = %b | y = %b", $time, x, y);
    end
endmodule
