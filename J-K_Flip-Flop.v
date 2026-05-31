`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2026 10:00:50 PM
// Design Name: 
// Module Name: Jk_ff
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


module Jk_ff(
input clk , 
input rst ,
input j,
input k,
output reg y
    );
    
    always @ (posedge clk or posedge rst ) begin
    if (rst) y <= 0;
    else if ((j==0)&&(k==0)) y <= y;
    else if ((j==0) && (k==1)) y <= 0;
    else if ((j==1) && (k==0)) y <= 1;
    else if ((j==1) && (k==1)) y <= ~y;
    
    end
endmodule
