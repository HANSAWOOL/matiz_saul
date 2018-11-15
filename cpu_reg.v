`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:16:46 07/10/2018 
// Design Name: 
// Module Name:    cpu_reg 
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
module cpu_reg( 
input [4:0] reg1,
input [4:0] reg2,
input [4:0] write_reg,
input [31:0] write_data,
input write,
input reset,
input load,
input store,
input [2:0] funct3,

output reg [31:0] read1,
output reg [31:0] read2
);


reg [31:0]register[31:0];
integer i = 0 ;

wire [31:0] register_for_store; 

assign register_for_store = register[reg2] ;
 


	always @ ( * ) begin 
		
		if (reset) begin
			for(i=0 ; i<32 ; i = i+1) begin
			register[i] <= 32'b00000000_00000000_00000000_00000000 ;
			end
		end
		
		else begin 
		read1 <= register[reg1];
			if ( !write ) begin  // write 신호가 없을때
				
				if ( store ) begin  // store 신호가 있을때     
				
					if(funct3 == 3'b000 ) begin      //SB
					read2 <= { {(24){register_for_store[31]}} , {register_for_store[7:0]} };
					end 
							
					else if(funct3 == 3'b001 ) begin   //SH
					read2 <= { {(16){register_for_store[31]}} , {register_for_store[15:0]} };
					end 
					else  begin  // SW
					read2 <= register_for_store;
					end 
							
				end 			
				else begin	 //store 신호가 없을때
				read2 <= register[reg2];
				end 		
				
			end 
			else begin   //  write 신호가 있을때
				if ( store ) begin     // store 신호가 있을때
		
					if(funct3 == 3'b000 ) begin      //SB
					read2 <= { {(24){register_for_store[31]}} , {register_for_store[7:0]} };
					end 
							
					else if(funct3 == 3'b001 ) begin   //SH
					read2 <= { {(16){register_for_store[31]}} , {register_for_store[15:0]} };
					end 
					else  begin  // SW
					read2 <= register_for_store;
					end 
							
				end 			
				else begin	  // store 신호가 없을때
				read2 <= register[reg2];
				end 	
				
				if(load) begin
		
					if(funct3 == 3'b000 ) begin      // LB
					register[write_reg] <= { {(24){write_data[31]}} , {write_data[7:0]} } ;
					end 
							
					else if(funct3 == 3'b001 ) begin   // LH
					register[write_reg] <= { {(16){write_data[31]}} , {write_data[15:0]} } ;
					end 

					else if(funct3 == 3'b100 ) begin  // LBU
					register[write_reg] <= { {(24){1'b0}} , {write_data[7:0]} } ;				
					end 
							
					else if(funct3 == 3'b101 ) begin   // LHU
					register[write_reg] <= { {(16){1'b0}} , {write_data[15:0]} } ;				
					end 		
					//if(funct3 == 3'b010 ) begin
					else  begin   // LW
					register[write_reg] <=  write_data ;				
					end 
							
				end 				
				else begin
				register[write_reg] <= write_data;
				end 				
				
			end 
		
		end				
		
	end 
	
endmodule
