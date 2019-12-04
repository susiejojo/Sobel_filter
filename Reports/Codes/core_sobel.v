`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:48 10/29/2019 
// Design Name: 
// Module Name:    core_sobel 
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
module core_sobel ( p0, p1, p2, p3, p5, p6, p7, p8, out);

input  [7:0] p0,p1,p2,p3,p5,p6,p7,p8;	// 8 bit pixels inputs
output [7:0] out;					// 8 bit output pixel

wire signed [10:0] gx,gy;    //11 bits because max value of gx and gy is 
//255*4 and last bit for sign					
wire signed [10:0] abs_gx,abs_gy;	//it is used to find the absolute value of gx and gy
wire [10:0] sum;			//the max value is 255*8. here no sign bit needed.
wire signed [7:0] temp1;
//wire p1,p2,p3,p4,p5,p6;
wire c1;
par_addsub sub1(p2,p0,1,temp1,c1);
wire signed [7:0] temp2;
wire c2;
par_addsub sub2(p5,p3,1,temp2,c2);
wire signed [7:0] temp3;
wire c3;
par_addsub sub3(p8,p6,1,temp3,c3);
assign gx=(temp1+(temp2<<1)+temp3);//sobel mask for gradient in horiz. direction

wire signed [7:0] temp4;
wire c4;
par_addsub sub4(p0,p6,1,temp4,c4);
wire signed [7:0] temp5;
wire c5;
par_addsub sub5(p1,p7,1,temp5,c5);
wire signed [7:0] temp6;
wire c6;
par_addsub sub6(p2,p8,1,temp6,c6);
assign gy=(temp4+(temp5<<1)+temp6);//sobel mask for gradient in vertical direction

assign abs_gx = (gx[10]? ~gx+1 : gx);	// to find the absolute value of gx.
assign abs_gy = (gy[10]? ~gy+1 : gy);	// to find the absolute value of gy. / bitwise negation +1 is 2's comp. of value.
assign sum = (abs_gx+abs_gy);			// finding the sum
//assign sum = sum >> 2;
assign out = (|sum[10:8])?8'hff : sum[7:0];	// to limit the max value to 255 / sum[10]|sum[9]|sum[8]=1 then out=255 else: sum[7:0]

endmodule


