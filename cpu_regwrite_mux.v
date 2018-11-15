`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:20:06 07/13/2018 
// Design Name: 
// Module Name:    cpu_regwrite_mux 
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
module cpu_regwrite_mux(
input [311:0] inputdata_0 , 
input [31:0] inputdata_1 , 
input selecter ,

output [31:0] outputdata 
);

reg [31:0] outputdata;


always @ (*) begin

if (selecter) begin 
outputdata <= inputdata_1;
end  

else begin 
outputdata <= inputdata_0;
end 

end 


endmodule
