`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2026 12:26:02 PM
// Design Name: 
// Module Name: test_bench
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


module test_bench();
wire y;
reg clk,rst;
always #10 clk <= ~clk;
fd fd1(.clk(clk),.rst(rst),.y(y));
initial begin 
clk=0;rst=0;
$monitor( clk , rst , y);
#20
rst=1;#30;rst=0;
end
endmodule
