`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:48:37 07/13/2018
// Design Name:   cpu_alu_control
// Module Name:   /home/ise/verilog_src/matiz/cpu_alu_control_tb.v
// Project Name:  matiz
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_alu_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_alu_control_tb;

	// Inputs
	reg [6:0] funct7;
	reg [2:0] funct3;

	// Outputs
	wire [2:0] alu_control;

	// Instantiate the Unit Under Test (UUT)
	cpu_alu_control uut (
		.funct7(funct7), 
		.funct3(funct3), 
		.alu_control(alu_control)
	);

	initial begin
		// Initialize Inputs
		funct7 = 0;
		funct3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

