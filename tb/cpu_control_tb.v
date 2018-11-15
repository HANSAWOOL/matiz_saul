`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:34:20 07/13/2018
// Design Name:   cpu_control
// Module Name:   /home/ise/verilog_src/matiz/cpu_control_tb.v
// Project Name:  matiz
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_control_tb;

	// Inputs
	reg [6:0] opcode;

	// Outputs
	wire branch;
	wire WB;
	wire jal;
	wire reg_write;
	wire reg_wirte_mux;
	wire mem_write;
	wire alu_input_mux;
	wire store;
	wire I_type;
	wire S_type;
	wire B_type;
	wire U_type;
	wire J_type;

	// Instantiate the Unit Under Test (UUT)
	cpu_control uut (
		.opcode(opcode), 
		.branch(branch), 
		.WB(WB), 
		.jal(jal), 
		.reg_write(reg_write), 
		.reg_wirte_mux(reg_wirte_mux), 
		.mem_write(mem_write), 
		.alu_input_mux(alu_input_mux), 
		.store(store), 
		.I_type(I_type), 
		.S_type(S_type), 
		.B_type(B_type), 
		.U_type(U_type), 
		.J_type(J_type)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

