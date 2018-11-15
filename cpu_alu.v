`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:23:06 07/11/2018 
// Design Name: 
// Module Name:    cpu_alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cpu_alu( 
	input [31:0]rs1,   // rs 1
	input [31:0]rs2,   // rs 2
	input [3:0] alu_control,
	input [31:0] offset,   // input_alu_mux    
	input input_alu_mux_select,  
	input shamt,
	input [31:0] pc,
	input LUI,
	input AUIPC,

	output reg zero = 0 ,
	output reg [31:0]result
);
	wire [31:0] input_2 ;
	
	wire signed [31:0] rs1_signed ;
	wire signed [31:0] input_2_signed;
	
	wire [4:0]shamt_imm ;

	//integer i = 0 ;
	
	
	localparam ADD = 4'b0001;
	localparam SUB  = 4'b0010;
	localparam AND = 4'b0011;
	localparam OR   = 4'b0100;
	localparam XOR = 4'b0101;
	localparam SHIFT_lift = 4'b0110;
	localparam SHIFT_right = 4'b0111;
	localparam COMPARE_large = 4'b1000;
	localparam COMPARE_small = 4'b1001;
	localparam COMPARE_equal = 4'b1010;
	localparam COMPARE_large_unsinged = 4'b1011;
	localparam COMPARE_small_unsinged = 4'b1100;
	localparam SHIFT_RIGHT_ARITHMATHIC = 4'b1101;
	localparam COMPARE_NOT_equal = 4'b1110;
	localparam COMPARE_LARGE_equal = 4'b1111;
	localparam COMPARE_LARGE_equal_unsigned = 4'b0000;
	
	mux input_alu_mux (
		//input
		.inputdata_0(rs2), 
		.inputdata_1(offset),   
		.selecter(input_alu_mux_select), 
		//output
		.outputdata(input_2)
	);
	
	
	assign rs1_signed = rs1;
	assign input_2_signed = input_2;
	assign shamt_imm = input_2[4:0];
		
	
	
	always @ (*) begin 
	

	
	case (alu_control) 
		ADD : begin 
			if(LUI) begin
			result <= input_2_signed ;
			zero <= 0 ;
			end 
			else if (AUIPC) begin
			result <= pc + input_2_signed ;
			zero <= 0 ;
			end 
			else begin
			result <= rs1_signed + input_2_signed ; 
			zero <= 0 ;
			end 
		end 
		
		SUB : begin 
		result <= rs1_signed - input_2_signed ;
		zero <= 0 ;
		end 
		
		AND : begin 
		result <= rs1 & input_2 ;
		zero <= 0 ;
		end 
		
		OR : begin 
		result <= rs1 | input_2 ;
		zero <= 0 ;
		end 
		
		XOR : begin 
		result <= rs1 ^ input_2;
		zero <= 0 ;
		end 
		
		SHIFT_lift : begin 
			if (shamt) begin
			result <= ( rs1 << (shamt_imm) );
			zero <= 0 ;
			end
			else begin
			result <= ( rs1 << (input_2) );			
			zero <= 0 ;
			end 
		end 
		
		
		SHIFT_right : begin 
			if (shamt) begin		
			result <= ( rs1 >> (shamt_imm) );
			zero <= 0 ;
			end
			else begin
			result <= ( rs1 >> (input_2) );			
			zero <= 0 ;
			end 
		end 
		
		COMPARE_large : begin 
			if (rs1_signed > input_2_signed) begin
			result <= 1;
			zero <= 1 ;
			end 
			else begin 
			result <= 0;
			zero <= 0 ;
			end 
		end 
		
		COMPARE_LARGE_equal : begin 
			if (rs1_signed >= input_2_signed) begin
			result <= 1;
			zero <= 1 ;
			end 
			else begin 
			result <= 0;
			zero <= 0 ;
			end 
		end 
		
		COMPARE_LARGE_equal_unsigned : begin 
			if (rs1 >= input_2) begin
			result <= 1;
			zero <= 1 ;
			end 
			else begin 
			result <= 0;
			zero <= 0 ;
			end 
		end 
		
	
		COMPARE_small : begin 
			if (rs1_signed < input_2_signed) begin
			result <= 1;
			zero <= 1 ;
			end 
			else begin 
			result <= 0;
			zero <= 0 ;
			end 
		end 
	
		COMPARE_equal : begin 
			if (rs1_signed == input_2_signed) begin
			result <= 1;
			zero <= 1 ;
			end 
			else begin 
			result <= 0;
			zero <= 0 ;
			end 
		end 
		
		
		COMPARE_NOT_equal : begin 
			if (rs1_signed != input_2_signed) begin
			result <= 1 ;
			zero <= 1 ;
			end 
			else begin 
			result <= 0;
			zero <= 0 ;
			end 
		end 
		
		COMPARE_large_unsinged : begin 
			if (rs1 > input_2) begin
			result <= 1;
			zero <= 1 ;
			end 
			else begin 
			result <= 0;
			zero <= 0 ;
			end 
		end 
		
		COMPARE_small_unsinged : begin 
			if (rs1 < input_2) begin
			result <= 1;
			zero <= 1 ;
			end 
			else begin 
			result <= 0;
			zero <= 0 ;
			end 
		end 
		
		
		SHIFT_RIGHT_ARITHMATHIC : begin
			if (shamt) begin
			result <= ( rs1 >>> (shamt_imm) );
			zero <= 0 ;
			end
			else begin
			result <= ( rs1 >>> (input_2) );			
			zero <= 0 ;
			end 		
		end 
		
		endcase 	
		
	end 




endmodule
