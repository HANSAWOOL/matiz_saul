`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:03:20 07/10/2018 
// Design Name: 
// Module Name:    cpu_alu_control 
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
module cpu_alu_control( 
input [6:0] funct7, 
input [2:0] funct3, 

output reg [2:0] alu_control
);




localparam ADD = 3'b001;
localparam SLT  = 3'b010;
localparam AND = 3'b011;
localparam OR   = 3'b100;
localparam XOR = 3'b101;
localparam SHIFT = 3'b110;


initial begin

alu_control = 0 ; // initialization to 0

end 

	always @ (*) begin

		case(funct3) 

			3'b000 : begin     //  add , sub ,   (using funct7)        //     
				// add , sub, sb, addi, lb, jalr, beq, fence, ecall, ebreak
				if(7'b0000000) begin 
				alu_control <=  ADD;
				end
				
				else begin 
				alu_control <= SLT;
				end 
			end 

			3'b001 : begin      // sll
				// bne, lh, sh, slli, sll, csrrw, fencei
				if(7'b0000000) begin 
				alu_control <=  SHIFT;
				end
			end 

			3'b010 : begin     // slt    set less than 
				//  lw , sw, slti, slt, csrrs, 
			end 

			3'b011 : begin     // sltu
				// sltu, csrrc, sltiu, 
			end 

			3'b100 : begin     // xor
				// blt, lbu, xori, xor, 
				alu_control <= XOR;
			end 

			3'b101 : begin    // srl
				// bge, lhu, srli, srai, srl, sra, csrrwi, 
				
			end 

			3'b110 : begin    // or
				// blt, or, ori, csrrsi, 
				alu_control <= OR;
			end 

			3'b111 : begin    // and 
				// bgeu, andi, and, csrrci,
				alu_control <= AND;
			end 

		endcase

	end 

endmodule
