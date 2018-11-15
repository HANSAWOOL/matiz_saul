`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:31:54 07/17/2018
// Design Name:   cpu
// Module Name:   /home/ise/verilog_src/matiz/cpu_tb.v
// Project Name:  matiz
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_tb;

	// Inputs
	reg clk_from_external;
	reg [31:0] inputdata_from_external_bus;
	reg reset_from_external;
	reg interrupt_from_external;

	// Outputs
	wire [31:0] outputdata_to_external_bus;
	wire [31:0] address_to_external_bus_from_cpu;
	wire [3:0] control_output_to_external_bus;
	wire interrupt_grant_from_pc;
	
	always #5 clk_from_external = ~clk_from_external;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.clk_from_external(clk_from_external), 
		.inputdata_from_external_bus(inputdata_from_external_bus), 
		.reset_from_external(reset_from_external), 
		.interrupt_from_external(interrupt_from_external),
		.outputdata_to_external_bus(outputdata_to_external_bus), 
		.address_to_external_bus_from_cpu(address_to_external_bus_from_cpu), 
		.control_output_to_external_bus(control_output_to_external_bus),
		.interrupt_grant_from_pc(interrupt_grant_from_pc)
	);

	initial begin
		// Initialize Inputs
		clk_from_external = 0;
		inputdata_from_external_bus = 0;
		reset_from_external = 1;
		interrupt_from_external = 0 ;

		// Wait 100 ns for global reset to finish
		#90;
      
		reset_from_external = 0;		
		// Add stimulus here
		#15;
		
		inputdata_from_external_bus = 32'b0000001_00010_00001_010_00001_0100011;	//SW	
		
		#30;
		interrupt_from_external = 1;
		
		#80;
		interrupt_from_external = 0;		
		
		#10; 
		
		inputdata_from_external_bus = 32'b00000000000000000001_00000_0110111;	//lui

		#40;
		
		inputdata_from_external_bus = 32'b00000000000000000001_00000_0100111;	//AUIPC	

		#40;
		
		inputdata_from_external_bus = 32'b00000000000000000001_00000_1101111;	//JAL

		#40;
		
		inputdata_from_external_bus = 32'b000000000001_00001_000_00000_1100111;	//JALR

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_000_00010_1100011;	//BEQ

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_001_00010_1100011;	//BNE

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_100_00010_1100011;	//BLT

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_101_00010_1100011; 	//BGE

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_110_00010_1100011;	//BLTU

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_111_00010_1100011;	//BGEU


		#40;
		
		inputdata_from_external_bus = 32'b000000000000_00001_000_00000_0000011 ; 	//LB

		#40;
		
		inputdata_from_external_bus = 32'b000000000000_00010_001_00000_0000011 ;	//LH
		
		#40;
		
		inputdata_from_external_bus = 32'b000000000000_00011_010_00000_0000011 ;	//LW		
		

		#40;
		
		inputdata_from_external_bus = 32'b000000000000_00100_100_00000_0000011 ; 	//LBU

		#40;
		
		inputdata_from_external_bus = 32'b000000000000_00101_101_00000_0000011 ;	//LHU
		
		#40;
		
		inputdata_from_external_bus = 32'b0000001_00110_00101_000_00001_0100011;	//SB
		
		#40;
		
		inputdata_from_external_bus = 32'b0000001_00100_00011_001_00001_0100011;	//SH
		
		
		#40;
		
		inputdata_from_external_bus = 32'b0000001_00010_00001_010_00001_0100011;	//SW		



		#40;
		
		inputdata_from_external_bus = 32'b000000000001_00001_000_00000_0010011;	//ADDI

		#40;
		
		inputdata_from_external_bus = 32'b000000000001_00001_010_00000_0010011;	//SLTI

		#40;
		
		inputdata_from_external_bus = 32'b000000000001_00001_011_00000_0010011;	//SLTIU

		#40;
		
		inputdata_from_external_bus = 32'b000000000001_00001_100_00000_0010011;	//XORI

		#40;
		
		inputdata_from_external_bus = 32'b000000000001_00001_110_00000_0010011;	//ORI

		#40;
		
		inputdata_from_external_bus = 32'b000000000001_00001_111_00000_0010011;	//ANDI

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00000_00001_001_00000_0010011;	//SLLI

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00000_00001_101_00000_0010011;	//SRLI	

		#40;
		
		inputdata_from_external_bus = 32'b0100000_00000_00001_101_00000_0010011;	//SRAI	

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_000_00000_0010011;	//ADD	

		#40;
		
		inputdata_from_external_bus = 32'b0100000_00010_00001_000_00000_0010011;	//SUB	

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_001_00000_0010011;	//SLL	

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_010_00000_0010011;	//SLT	

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_011_00000_0010011;	//SLTU	

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_100_00000_0010011;	//XOR	

		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_101_00000_0010011;	//SRL

		#40;
		
		inputdata_from_external_bus = 32'b0100000_00010_00001_101_00000_0010011;	//SRA
		
		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_110_00000_0010011;	//OR
		
		#40;
		
		inputdata_from_external_bus = 32'b0000000_00010_00001_111_00000_0010011;	//AND
		
		
	end
		initial begin
	$dumpvars(0);
#100000ns;
$finish;
end



		

      
endmodule

