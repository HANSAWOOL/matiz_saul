`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:45:22 07/19/2018 
// Design Name: 
// Module Name:    cpu_reg_for_store_load 
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
module cpu_reg_for_store_load(
input [31:0] register,
input load,
input store, 
input [2:0] funct3,

output reg [31:0] store_load_data
    );

always @ ( * )	 begin 

	if ( store ) begin   //   
	
		if(funct3 == 3'b000 ) begin      //SB
		store_load_data <= { {(24){register[31]}} , {register[7:0]} };
		end 
				
		else if(funct3 == 3'b001 ) begin   //SH
		store_load_data <= { {(16){register[31]}} , {register[15:0]} };
		end 

		else if(funct3 == 3'b010 ) begin    // SW
		store_load_data <= register;
		end 
				
	end 
	
	else if(load) begin
	
		if(funct3 == 3'b000 ) begin      // LB
		store_load_data <= { {(24){register[31]}} , {register[7:0]} } ;
		end 
				
		else if(funct3 == 3'b001 ) begin   // LH
		store_load_data <= { {(16){register[31]}} , {register[15:0]} } ;
		end 

		else if(funct3 == 3'b010 ) begin   // LW
		store_load_data <=  register ;				
		end 
				
		else if(funct3 == 3'b100 ) begin  // LBU
		store_load_data <= { {(24){1'b0}} , {register[7:0]} } ;				
		end 
				
		else if(funct3 == 3'b101 ) begin   // LHU
		store_load_data <= { {(16){1'b0}} , {register[15:0]} } ;				
		end 				
	
	end 
	
end 

endmodule
