`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:29:00 07/10/2018 
// Design Name: 
// Module Name:    mux 
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
module mux
(
input [31:0] inputdata_0 , 
input [31:0] inputdata_1 , 
input selecter ,

output reg [31:0] outputdata 
);

always @ (*) begin

if (selecter) begin 
outputdata <= inputdata_1;
end  

else begin 
outputdata <= inputdata_0;
end 

end 


endmodule
