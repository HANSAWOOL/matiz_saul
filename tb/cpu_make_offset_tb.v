`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:29:44 07/13/2018
// Design Name:   cpu_make_offset
// Module Name:   /home/ise/verilog_src/matiz/cpu_make_offset_tb.v
// Project Name:  matiz
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_make_offset
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_make_offset_tb;

	// Inputs
	reg [24:0] instruction;
	reg I_type;
	reg S_type;
	reg B_type;
	reg U_type;
	reg J_type;

	// Outputs
	wire [31:0] offset;

	// Instantiate the Unit Under Test (UUT)
	cpu_make_offset uut (
		.instruction(instruction), 
		.I_type(I_type), 
		.S_type(S_type), 
		.B_type(B_type), 
		.U_type(U_type), 
		.J_type(J_type), 
		.offset(offset)
	);

	initial begin
		// Initialize Inputs
		instruction = 0;
		I_type = 0;
		S_type = 0;
		B_type = 0;
		U_type = 0;
		J_type = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

