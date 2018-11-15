`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:52:11 07/20/2018
// Design Name:   cpu_pc
// Module Name:   /home/ise/verilog_src/matiz/cpu_pc_tb.v
// Project Name:  matiz
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_pc_tb;

	// Inputs
	reg clk;
	reg [31:0] offset;
	reg reset;
	reg interrupt;
	reg branch;
	reg zero; 
	reg jal;
	reg jalr;
        reg [31:0]  result_from_alu;

	// Outputs
	wire [31:0] pc;
	wire interrupt_grant;
	
	always #5 clk = ~clk ;

	// Instantiate the Unit Under Test (UUT)
	cpu_pc uut (
		.clk(clk), 
		.offset(offset), 
		.reset(reset), 
		.interrupt(interrupt), 
		.branch(branch),
		.zero(zero),
		.jal(jal),
		.jalr(jalr),
		.result_from_alu(result_from_alu),

		.pc(pc),
		.interrupt_grant(interrupt_grant)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		offset = 0;
		reset = 1;
		branch = 0;
		zero = 0;
		jal = 0;
		jalr =  0;
		interrupt = 0;
		result_from_alu=0;

		// Wait 100 ns for global reset to finish
		#100;
      
		reset = 0;
		
		#100;
		
		interrupt  = 1 ;
		
		#485;
		
		interrupt = 0 ;


	
		
		// Add stimulus here

	end
      
endmodule

