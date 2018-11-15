`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:41:10 07/10/2018
// Design Name:   cpu_reg
// Module Name:   /home/ise/verilog_src/matiz/cpu_reg_tb.v
// Project Name:  matiz
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_reg_tb;

	// Inputs
	reg [4:0] reg1;
	reg [4:0] reg2;
	reg [4:0] write_reg;
	reg write;
	reg reset;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] read1;
	wire [31:0] read2;

	// Instantiate the Unit Under Test (UUT)
	cpu_reg uut (
		.reg1(reg1), 
		.reg2(reg2), 
		.write_reg(write_reg), 
		.write(write), 
		.reset(reset), 
		.write_data(write_data), 
		.read1(read1), 
		.read2(read2)
	);

	initial begin
		// Initialize Inputs
		reg1 = 0;
		reg2 = 0;
		write_reg = 0;
		write = 0;
		reset = 0;
		write_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reg1 = 0;
		reg2 = 0;
		write_reg = 0;
		write = 0;
		reset = 1;
		write_data = 0;
		
		#100;
        
		reg1 = 0;
		reg2 = 0;
		write_reg = 5'b00000;
		write = 1;
		reset = 0;
		write_data = 32'b00000000_00000000_00000000_00000011;
		

		#100;
        
		reg1 = 5'b00000;
		reg2 = 0;
		write_reg = 0;
		write = 0;
		reset = 0;
		write_data = 0;
		
		
		
		

	end
      
endmodule

