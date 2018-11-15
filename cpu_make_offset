`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:34:23 07/11/2018 
// Design Name: 
// Module Name:    cpu_make_offset 
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
module cpu_make_offset(
	input [31:0] instruction,
	input I_type,
	input S_type,
	input B_type,
	input U_type,
	input J_type,
	input LUI,
	input AUIPC,

	
	
	output reg [31:0] offset	
);
	
	wire [2:0] funct3 = instruction[14:12]; 
	
	wire [31:0] B_type_imm_merge;
	wire [31:0] S_type_imm_merge;
	wire [31:0] J_type_imm_merge;
	wire [31:0] U_type_imm_merge;
	wire [31:0] I_type_imm_merge;
	//wire [6:0]imm1;   // for S B type
	//wire [4:0]imm2;   // for S B type
	//wire [19:0]imm3;  // for j_type

	//assign imm1 = instruction[24:18];
	//assign imm2 = instruction[4:0];
	//assign imm3 = instruction[24:5];
		
	assign B_type_imm_merge = { {20{instruction[31]}},instruction[7],instruction[30:25],instruction[11:8],1'b0} ;
	assign S_type_imm_merge = {{21{instruction[31]}},instruction[30:25],instruction[11:8],instruction[7]} ;
	assign U_type_imm_merge = {instruction[31],instruction[30:21],instruction[19:12],{12{1'b0}}};  
	assign J_type_imm_merge = { {12{instruction[31]}},instruction[19:12],instruction[20],instruction[30:25],instruction[24:21],1'b0};
	assign I_type_imm_merge = {{21{instruction[31]}},instruction[30:20]};
	
	always @ ( * ) begin 
		if (I_type) begin 
		offset <= I_type_imm_merge ;
		end
		
		else if (U_type) begin
		offset <= U_type_imm_merge ;
		end 
		
		else if (S_type) begin		
		offset <= S_type_imm_merge ;		
		end 
		
		else if (J_type) begin
		offset <=  J_type_imm_merge;
		end 
		
		else if (B_type) begin
		offset <= B_type_imm_merge ;
		end 
		
		else if (LUI | AUIPC) begin
		offset <= {instruction[31:12],{(12){1'b0}}};
		end 
		
		
	
		else begin 
		offset <=0;
		end 
	end 


endmodule
