`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:38:50 07/13/2018
// Design Name:   cpu_alu
// Module Name:   /home/ise/verilog_src/matiz/cpualu_tb.v
// Project Name:  matiz
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpualu_tb;

	// Inputs
	reg [31:0] input_1;
	reg [31:0] input_2;
	reg [2:0] alu_control;

	// Outputs
	wire zero;
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	cpu_alu uut (
		.input_1(input_1), 
		.input_2(input_2), 
		.alu_control(alu_control), 
		.zero(zero), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		input_1 = 0;
		input_2 = 0;
		alu_control = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

