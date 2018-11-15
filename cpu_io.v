`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:56:31 07/16/2018 
// Design Name: 
// Module Name:    cpu_io 
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
module cpu_io(
	input clk,
	input[31:0] address_from_pc,
	input[31:0] address_from_alu,
	input[31:0] data_from_register_value_2,
	input[31:0] data_from_bus,
	input store,
	input load,
	input reset,
	input interrupt,
	
	output reg [31:0] address_to_bus, 
	output reg [31:0] data_to_bus,
	output reg [31:0] data_to_cpu,
	output reg [3:0]control_to_bus
	
    );
	

	
	reg [2:0] counter ;
	reg [2:0] counter_for_interrupt;
	
	always @ ( posedge clk ) begin	
		
		if (reset) begin 		
		address_to_bus <= 0;
		data_to_bus <= 0 ;
		data_to_cpu <= 0;
		control_to_bus <= 0 ;
		counter <= 0 ;		
		counter_for_interrupt <= 0;
		end 		
		
		else begin
			if (interrupt) begin
			counter_for_interrupt <= counter_for_interrupt + 3'b001;	
				
				if (counter_for_interrupt == 3'b111 ) begin         //     0
					data_to_bus <= data_from_register_value_2 ;  //  4번의 싸이클을 통해 한번은 alu에서 오는 값을 응답 받을 수 있고,, 한번은 레지스터에서 오는 값을 받을 수 있다.
					control_to_bus <= 4'b0100;  //   tristate  //  gp enable  //  0  //  0  
					counter_for_interrupt <= 3'b000;		
				end 

				else if (counter_for_interrupt == 3'b000 ) begin       //   1
					//data_to_cpu <= 0 ;
					control_to_bus <= 4'b1100 ;  			
				end 

				else if (counter_for_interrupt == 3'b001 ) begin    //    2
					//data_to_cpu <= 0 ;	
					control_to_bus <= 4'b1100;  //   tristate  //  gp enable  //  0  //  0  
				end 

				else if (counter_for_interrupt == 3'b010 ) begin     //     3
					data_to_cpu <= data_from_bus ;			
					control_to_bus <= 4'b0100;  //   tristate  //  gp enable  //  0  //  0  
				end 	 	
				
				else if (counter_for_interrupt == 3'b011 ) begin         //     4
					data_to_bus <= address_from_alu ;  // alu result 에서 오는 값이다.  //  4번의 싸이클을 통해 한번은 alu에서 오는 값을 응답 받을 수 있고,, 한번은 레지스터에서 오는 값을 받을 수 있다.
					control_to_bus <= 4'b0100;  //   tristate  //  gp enable  //  0  //  0  
				end 

				else if (counter_for_interrupt == 3'b100 ) begin       //   5
					//data_to_cpu <= 0;
					control_to_bus <= 4'b1100 ;  			
				end 

				else if (counter_for_interrupt == 3'b101 ) begin    //    6
					//data_to_cpu <= 0 ;  
					control_to_bus <= 4'b1100;  //   tristate  //  gp enable  //  0  //  0  
				end 

				else if (counter_for_interrupt == 3'b110 ) begin     //     7
					data_to_cpu <= data_from_bus ;			
					control_to_bus <= 4'b0100;  //   tristate  //  gp enable  //  0  //  0  
				end 	 	
				
			end 
			
			else begin
			counter <= counter + 3'b001;
		
				if (counter == 3'b101 ) begin         //     0
				counter <=  2'b00;
					if(load) begin
					control_to_bus <= 4'b0001 ;
					data_to_cpu <= data_from_bus;	 //  load 명령어 했을때 데이터를 메모리에서 가져와야 한다.
					end 
					else begin
					control_to_bus <= 4'b0000;					
					end 
				end 

				else if (counter == 3'b011 ) begin       //   4
					if(store) begin     // memwrite_from_control  1   memread     STORE
					address_to_bus <= address_from_alu ;
					data_to_bus <= data_from_register_value_2 ;
					control_to_bus <= 4'b0011 ;  // ---------------------------we 1     .--------------------   				
			
					//       /     /   we  /  en  /				
					end 				
					else if(load) begin   // LOAD 				
					address_to_bus <= address_from_alu ;  
					control_to_bus <= 4'b0001 ;   // ------------------------  we 0     .   --------    .
					end 		
					
					else begin
					control_to_bus <= 4'b0000;
					end 
					
				end 

				else if (counter == 3'b010 ) begin    //    3
				data_to_cpu <= data_from_bus ;
				control_to_bus <= 4'b1111 ;		
				end 

				else if (counter == 3'b000 ) begin     //     1
				address_to_bus <= address_from_pc ;
				control_to_bus <= 4'b0001;  //   	
				end 	 	

				else if (counter == 3'b001 ) begin    //    2
				end 
				
				
				else if (counter == 3'b100 ) begin    //    5
				end 

	
			end 	
		end	
	end 	
	
endmodule
