`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:26:11 07/19/2018 
// Design Name: 
// Module Name:    mux_5bit 
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
module mux_5bit(

input [4:0] inputdata_0 , 
input [4:0] inputdata_1 , 
input selecter ,

output reg [4:0] outputdata 
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

