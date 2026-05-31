`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2026 10:06:21 PM
// Design Name: 
// Module Name: fd
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


module fd(
input clk,
input rst,
output y
    );
    wire w1,w2,w3;
    Jk_ff jk1 (.clk(clk),.rst(rst),.y(w1),.j(1'b1),.k(1'b1));
    Jk_ff jk2 (.clk(w1),.rst(rst),.y(w2),.j(1'b1),.k(1'b1));
    Jk_ff jk3 (.clk(w2),.rst(rst),.y(w3),.j(1'b1),.k(1'b1));
    Jk_ff jk4 (.clk(w3),.rst(rst),.y(y),.j(1'b1),.k(1'b1));
endmodule
