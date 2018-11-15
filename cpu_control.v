`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:12:51 07/10/2018 
// Design Name: 
// Module Name:    cpu_control 
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
module cpu_control 
(
input [31:0] instruction,

output reg branch= 0,
output reg WB= 0,    // write back
output reg jal= 0,     //  jump  
output reg jalr= 0,
output reg reg_write= 0,    // register   
output reg reg_wirte_mux= 0,  // register  write      
output reg mem_write= 0,      // we 
output reg alu_input_mux= 0,   // alu   
output reg store= 0,
output reg load = 0,
//output reg useoffset = 0,
output reg I_type= 0,
output reg S_type= 0,
output reg B_type= 0,
output reg U_type= 0,
output reg J_type= 0,
output reg shamt = 0,
output reg LUI = 0,
output reg AUIPC = 0,


output reg[3:0] alu_control = 4'b0000

);

wire[6:0] opcode;
wire[6:0] funct7;
wire[2:0] funct3;  

// opcode 
localparam LUI_opcode = 7'b0110111 ;
localparam AUIPC_opcode = 7'b0010111 ;
localparam BRANCH = 7'b1100011 ;
localparam STORE = 7'b0100011 ;
localparam IMMADIATE = 7'b0010011;
localparam JAL = 7'b1101111 ;
localparam JALR = 7'b1100111 ;
localparam NEED2var = 7'b0110011 ;   // rd  
localparam LOAD = 7'b0000011 ;
localparam FENCE = 7'b0001111 ;
localparam CSR_group = 7'b1110011 ;


assign opcode = instruction [6:0] ;
assign funct7  = instruction [31:25] ;
assign funct3 = instruction [14:12] ; 

always @ (*) begin 

	case(opcode) 

		LUI_opcode : begin 
			branch<= 0;
			WB<= 0;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 1;    // register   
			reg_wirte_mux<= 1;  // register  write       for jal 
			mem_write<= 0;      // we 
			alu_input_mux<= 1;   // alu   
			store<= 0;
			load <= 0;
			//useoffset <= 0;
			I_type<= 0;
			S_type<= 0;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 1;
			AUIPC <= 0;
			
			
			alu_control <= 4'b0001;
		end 

		AUIPC_opcode : begin 
			branch<= 0;
			WB<= 0;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 1;    // register   
			reg_wirte_mux<= 1;  // register  write       for jal 
			mem_write<= 0;      // we 
			alu_input_mux<= 1;   // alu   
			store<= 0;
			load <= 0;
			//useoffset <= 0;
			I_type<= 0;
			S_type<= 1;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 0 ;
			AUIPC <= 1;
			
			alu_control <= 4'b0001;
		end 

		BRANCH :  begin  
			branch<= 1;
			WB<= 0;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 0;    // register   
			reg_wirte_mux<= 0;  // register  write      for jal  
			mem_write<= 0;      // we 
			alu_input_mux<= 1;   // alu   
			store<= 0;
			//useoffset <= 1;
			I_type<= 0;
			S_type<= 0;
			B_type<= 1;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 0 ;
			AUIPC <= 0;
			
			if(funct3 == 3'b000)  begin   //  BEQ
			alu_control <= 4'b1010;
			end 
			else if (funct3 == 3'b001) begin  // BNE
			alu_control <= 4'b1110;
			end 
			else if (funct3 == 3'b100) begin    // BLT
			alu_control <= 4'b1001;
			end 
			else if (funct3 == 3'b101) begin  // BGE
			alu_control <= 4'b1111;
			end 
			else if (funct3 == 3'b110 ) begin  // BLTU 
			alu_control <= 4'b1100;
			end 
			else if (funct3 == 3'b111) begin  // BGEU
			alu_control <= 4'b0000;
			end 
		
		end

		STORE : begin 
			branch<= 0;
			WB<= 1;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 0;    // register   
			reg_wirte_mux<= 0;  // register  write       for jal 
			mem_write<= 1;      // we 
			alu_input_mux<= 1;   // alu   
			store<= 1;
			load <= 0;
			//useoffset <= 0;
			I_type<= 0;
			S_type<= 1;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 0 ;
			AUIPC <= 0;
			
			alu_control <= 4'b0001;
		end  

		IMMADIATE : begin
			branch<= 0;
			WB<= 0;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 1;    // register   
			reg_wirte_mux<= 1;  // register  write  for jal      
			mem_write<= 0;      // we 
			alu_input_mux<= 1;   // alu   
			store<= 0;
			load <= 0;
			//useoffset <= 0;
			I_type<= 1;
			S_type<= 0;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			LUI <= 0 ;
			AUIPC <= 0;
			
			
			if (funct3 == 3'b001 ) begin //  SLLI 
			shamt <= 1;	 		
			alu_control <= 4'b0110;
			end 
			
			else if (funct3 == 3'b101 ) begin 
			shamt <= 1;	 		
				if (funct7 == 7'b0000000) begin  // SRLI
				alu_control <= 4'b0111;
				end 
				else if (funct7 == 7'b0100000) begin // SRAI
				alu_control <= 4'b1101 ;
				end 
			end 
			
			else if (funct3 == 3'b000) begin   // ADDI
			alu_control <= 4'b0001;
			end 
			else if (funct3 == 3'b010) begin  // SLTI
			alu_control <= 4'b1001;
			end
			else if (funct3 == 3'b011) begin  // SLTIU
			alu_control <= 4'b1100;
			end 
			else if (funct3 == 3'b100) begin  // XORI
			alu_control <= 4'b0101;
			end 
			else if (funct3 == 3'b110) begin   // ORI
			alu_control <= 4'b0100;
			end 
			else if (funct3 == 3'b111) begin   // ANDI
			alu_control <= 4'b0011;
			end 
			


		end 

		JAL : begin
			branch<= 0;
			WB<= 0;    // write back
			jal<= 1;     //  jump  
			jalr<= 0;
			reg_write<= 1;    // register   
			reg_wirte_mux<= 0;  // register  write   for jal    
			mem_write<= 0;      // we 
			alu_input_mux<= 0;   // alu   
			store<= 0;
			//useoffset <= 0;
			I_type<= 0;
			S_type<= 0;
			B_type<= 0;
			U_type<= 0;
			J_type<= 1;
			shamt <= 0;
			LUI <= 0 ;
			LUI <= 0 ;
			AUIPC <= 0;
			
			
			alu_control <= 4'b0001;  //     don't care
		end 

		JALR : begin
			branch<= 0;
			WB<= 0;    // write back
			jal<= 0;     //  jump  
			jalr<= 1;
			reg_write<= 1;    // register   
			reg_wirte_mux<= 0;  // register  write   for jal     
			mem_write<= 0;      // we 
			alu_input_mux<= 0 ;   // alu   
			store<= 0;
			//useoffset <= 0;
			I_type<= 1;
			S_type<= 0;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 0 ;
			AUIPC <= 0;
			
			alu_control <= 4'b0001;
		end 

		NEED2var : begin
			branch<= 0;
			WB<= 0;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 1;    // register   
			reg_wirte_mux<= 1;  // register  write     for jal   
			mem_write<= 0;      // we 
			alu_input_mux<= 0;   // alu   
			store<= 0;
			//useoffset <= 0;
			I_type<= 0;     //   R
			S_type<= 0;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 0 ;
			AUIPC <= 0;
			
			if(funct3 == 3'b000) begin
				if(funct7 == 7'b0000000) begin  // ADD
				alu_control <= 4'b0001;
				end 
				else if(funct7 == 7'b0100000) begin  //SUB
				alu_control <= 4'b00010;
				end 	
			end 
			else if (funct3 == 3'b001 ) begin //SLL
			alu_control <= 4'b0110; 
			end 
			else if (funct3 == 3'b010 ) begin  // SLT
			alu_control <= 4'b1001;
			end 
			else if (funct3 == 3'b011 ) begin  // SLTU
			alu_control <= 4'b0110;
			end
			else if (funct3 == 3'b100) begin  // XOR
			alu_control <= 4'b0101;    
			end 
			else if (funct3 == 3'b101) begin  // SRL
			alu_control <= 4'b0111;    
			end 
			else if (funct3 == 3'b101) begin  // SRA
			alu_control <= 4'b1101;    
			end 
			else if(funct3 == 3'b110) begin // OR
			alu_control <= 4'b0100;
			end 
			else if(funct3 == 3'b111) begin // AND 
			alu_control <= 4'b0011;
			end 
			

		end 

		LOAD : begin
			branch<= 0;
			WB<= 1;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 0;    // register   
			reg_wirte_mux<= 1;  // register  write      for jal  
			mem_write<= 0;      // we 
			alu_input_mux<= 1;   // alu   
			store<= 0;
			load <= 1;
			//useoffset <= 0;
			I_type<= 1;
			S_type<= 0;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 0 ;
			AUIPC <= 0;
			
			
			alu_control <= 4'b0001;
		end 

		FENCE : begin
			branch<= 1;
			WB<= 0;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 0;    // register   
			reg_wirte_mux<= 1;  // register  write       for jal 
			mem_write<= 0;      // we 
			alu_input_mux<= 1;   // alu   
			store<= 0;
			//useoffset <= 0;
			I_type<= 0;
			S_type<= 0;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 0 ;
			AUIPC <= 0;
			
		end 

		CSR_group : begin
			branch<= 0;
			WB<= 0;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 1;    // register   
			reg_wirte_mux<= 1;  // register  write       for jal 
			mem_write<= 0;      // we 
			alu_input_mux<= 1;   // alu   
			store<= 0;
			//useoffset <= 0;
			I_type<= 0;
			S_type<= 0;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 0 ;
			AUIPC <= 0;
			
		end 

		default begin 
			branch<= 0;
			WB<= 0;    // write back
			jal<= 0;     //  jump  
			jalr<= 0;
			reg_write<= 0;    // register   
			reg_wirte_mux<= 0;  // register  write       for jal 
			mem_write<= 0;      // we 
			alu_input_mux<= 0;   // alu   
			store<= 0;
			//useoffset <= 0;
			I_type<= 0;
			S_type<= 0;
			B_type<= 0;
			U_type<= 0;
			J_type<= 0;
			shamt <= 0;
			LUI <= 0 ;
			AUIPC <= 0;
			
		end 


	endcase 

end 





endmodule
