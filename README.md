# Sobel_filter
Sobel filter using Verilog on Xilinx ISE 13.4
> ### How to run
>> #### Pre-processing your image
>>> -generate a matrix from the image using imread() from MATLAB or cv.imread from Python
>>> -output the matrix into a .txt file storing the pixel values
>> #### Running the filter code
>>> -using ISE 13.4/ Vivado run Top.v on the generated .txt file
>>> -the output matrix is output to another .txt file
>> #### Viewing the output image
>>> - run post_processing.m on the output .txt file 
>>> - the image with edges detected is saved as result_img.txt
