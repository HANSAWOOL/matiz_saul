`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:26:10 07/13/2018
// Design Name:   mux
// Module Name:   /home/ise/verilog_src/matiz/mux_tb.v
// Project Name:  matiz
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_tb;

	// Inputs
	reg [31:0] inputdata_0;
	reg [31:0] inputdata_1;
	reg selecter;

	// Outputs
	wire [31:0] outputdata;

	// Instantiate the Unit Under Test (UUT)
	mux uut (
		.inputdata_0(inputdata_0), 
		.inputdata_1(inputdata_1), 
		.selecter(selecter), 
		.outputdata(outputdata)
	);

	initial begin
		// Initialize Inputs
		inputdata_0 = 0;
		inputdata_1 = 0;
		selecter = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

