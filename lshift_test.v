`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:16:02 11/25/2019
// Design Name:   lshift
// Module Name:   /home/susiejojo/Sems/Sem3/VLSID/verilog/Sobel_project/lshift_test.v
// Project Name:  Sobel_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lshift
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lshift_test;

	// Inputs
	reg a;

	// Outputs
	wire b;

	// Instantiate the Unit Under Test (UUT)
	lshift uut (
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 4'b0000;

		// Wait 100 ns for global reset to finish
		#10;
		a = 4'b1000;
		#10; 
		a = 4'b1010;
		#10;
		a = 4'b1100;
        
		// Add stimulus here

	end
      
endmodule

