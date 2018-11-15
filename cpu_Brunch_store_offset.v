`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:01:17 07/11/2018 
// Design Name: 
// Module Name:    cpu_Branch_store_offset 
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
module cpu_Branch_store_offset(
	input [31:0]instruction, 
	input branch_offset,
	input store_offset,
	input jump_offset,
	
	output [31:0] offset	
);
	
	reg[31:0] offset;
	wire [11:0] branch_imm_merge;
	wire [11:0] store_imm_merge;
	wire [19:0] jump_imm_merge;

	assign branch_imm_merge = {instruction[31],instruction[7],instruction[20:25],instruction[11:8]} ;
	assign store_imm_merge = {instruction[31:25],instruction[11:7]} ;
	assign jump_imm_merge = {instruction[31],instruction[19:12],instruction[20],instruction[30:21]} ;

	always @ ( branch_offset or store_offset) begin 
		if (branch_offset) begin 
		offset <= {branch_imm_merge,20'b0000000000_0000000000} ;
		end
		
		else if (store_offset) begin
		offset <= {store_imm_merge,20'b0000000000_0000000000} ;
		end 
		
		else if (jump_offset) begin 
		offset < = {jump_imm_merge,20'b0000000000_00} ;
		end 
		
		else begin 
		offset <=0;
		end 
	end 


endmodule
