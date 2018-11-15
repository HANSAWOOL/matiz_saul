`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:34:02 07/16/2018 
// Design Name: 
// Module Name:    cpu_pc 
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
module cpu_pc( 
input clk,
input signed [31:0] offset,
input reset ,
input interrupt,
input branch,
input zero,
input jal,
input jalr,
input signed [31:0] result_from_alu,

output reg [31:0] pc,  
output reg interrupt_grant 
);

reg [2:0] counter ;  //  stall   
reg [1:0] counter_for_interrupt;



			always @ (posedge clk) begin 			
			
				if (reset) begin 
				pc <= 0 ;
				counter <= 0 ;				
				counter_for_interrupt <= 0 ;
				interrupt_grant <= 0 ;
				end 
				
				else begin     // reset 
				
					if (interrupt) begin   //    1  
						counter_for_interrupt <=  counter_for_interrupt+ 2'b01 ;
						
						if (counter_for_interrupt == 2'b01 )begin     // 2
						interrupt_grant <= 0 ;
						end 
						
						else if(counter_for_interrupt == 2'b00) begin   //1						
						interrupt_grant <= 1 ;
						end 
						
						else if (counter_for_interrupt == 2'b11 )begin     // 0
						counter_for_interrupt <= 2'b00;						
						interrupt_grant <= 0 ;
						end 
						
						else begin  //  3
						interrupt_grant <= 0 ;
						end 	
						
					end 
					
					 else begin   //      
						counter <= counter + 3'b001 ;
						
						if(counter == 3'b000) begin           // 1
						interrupt_grant <= 1 ;								
						end 
										
						
						else if (counter == 3'b001) begin          //   2    
						interrupt_grant <= 0 ;
						end 
						
						else if (counter == 3'b010) begin          //   3   
						interrupt_grant <= 0 ;
						end 
						
						else if (counter == 3'b011) begin        //   4
						interrupt_grant <= 0 ;
							if (branch) begin
							pc <= (branch & zero)  ?  pc+offset   :  pc + 4  ;
							end 
							else if (jal) begin
							pc <= pc + offset; 
							end 
							else if (jalr) begin 
							pc <= pc+ result_from_alu;
							end 
							else begin
							pc <= pc  + 4 ;
							end 
						end 
						
						else if (counter == 3'b100) begin          //   5   
						interrupt_grant <= 0 ;
						end 
						
						else if (counter == 3'b101 )begin       //   0
						interrupt_grant <= 0 ;
						counter <= 3'b000;
						end 
						
						
					end 
					
				end
				
			
			
			end




endmodule
