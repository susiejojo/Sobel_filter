`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:12 11/24/2019 
// Design Name: 
// Module Name:    testbench_sobel 
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

module testbench_sobel (mem_bus_in,mem_bus_out,mem_data_strobe,mem_bus_rw,bus_in,bus_out,data_strobe,bus_rw,clk, reset);

output reg [7:0] mem_bus_in;
input [71:0] mem_bus_out;
output reg [71:0] bus_in;
input [7:0] bus_out;
reg tmp;
output reg mem_data_strobe;
output reg data_strobe;
output reg reset;
output reg clk;
output reg mem_bus_rw;
output reg bus_rw;
reg [9:0] col;
reg [18:0] Count1;
reg [18:0] Count2;
reg clk2;
reg [8:0] row;
reg [7:0] memory [0:307200];
integer result,position;
//eg [15:0] i;
integer i;
integer datafile;
//clk
initial begin
	clk=0;
end
always #5 clk=~clk; 
//Initial values
initial begin
	reset=1;
	mem_data_strobe=1;
	mem_bus_rw=0;
	bus_rw = 0;
	data_strobe=1;
	Count1 = 19'b0;
	Count2 = 19'b0;
	row=9'b0;
	col=10'b0;
	#5 reset=0;
	#20 reset=1;
	
	
end
	
//make a new file to read data and save results
	initial begin
	position = 0;
	//i = 0;
	//$readmemb("Test.txt",memory);
	result=$fopen ("result_img1.txt","w");
	datafile=$fopen ("data1.txt","r");
	end
//Load data	To Mem
	always @ (posedge clk)
		begin
			if(reset)
				begin
					if(!mem_bus_rw)
						begin
						//tmp = $fclose(datafile,"r");
							if(clk)
								begin
									mem_data_strobe <= 0;
									if(row != 480)
										begin
											if(col != 640)
												begin
												$fscanf(datafile,"%d",mem_bus_in);
												//	always @i mem_bus_in = memory[i];
													
													//$monitor("%d \t",mem_bus_in);
													col <= col+1;
												end
											else if (col == 640)
												begin
												$fscanf(datafile,"%d\n",mem_bus_in);
													//always @i mem_bus_in = memory[i];
													
													col <= 1;
													row <= row+1;
													//position = $ftell(datafile);
												end
										end
									else
										begin
											mem_bus_rw <= 1;
											row <= 0;
											col <= 0;
										end
								end
							else
								mem_data_strobe <= 1;
						end
				end
				mem_data_strobe <= 0;
		end

//Load data	
	always @ (posedge clk)
		begin
			if(mem_bus_rw)
				if(!bus_rw)
					begin
						if(clk)
							begin	
								if(Count1 != 304964)
									begin
										bus_in <= mem_bus_out;
										//$display("%d",Count1);
										Count1 <= Count1+1;
										bus_rw <= 1;
									end
								else 
									begin
										//Count1 <= 0;
										bus_rw <= 1;
									end
								mem_data_strobe <= 1;
								data_strobe <= 0;
								//$display("%d %d \t",data_strobe,bus_rw);
							end
						else
							begin
								data_strobe <= 1;
							end
					end
		end
		
//read from FPGA and write results to file
	always @ (posedge clk)
		begin
			if(mem_bus_rw)
				if(bus_rw)
					begin
						if(clk)
							begin
								if(Count2 != 304964)
									begin
										$fwrite (result,"%d\n",bus_out);
										Count2 <= Count2+1;
										bus_rw <= 0;
									end
								else
									begin
										mem_bus_rw <= 0;
										bus_rw <= 0;
										Count2 <= 0;
									end
							end
						else
							begin
								mem_data_strobe <= 0;
								data_strobe <= 0;
							end
					end
		end
				
endmodule
	

