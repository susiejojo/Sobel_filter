# Sobel_filter
Sobel filter using Verilog on Xilinx ISE 13.4
### What is Sobel Filter?
It is used to detect edges(mainly horizontal and vertical) in an image using a convolving it with a 3 by 3 kernel.
### Application
This implementation of Sobel Filter works on 640 by 480 images. The primary application is on grayscale images but we have extended the implementation to RGB images by taking all 3 channels into account.
### How to run
#### Pre-processing your image
> - generate a matrix from the image using imread() from MATLAB or cv.imread from Python
> - output the matrix into a .txt file storing the pixel values
#### Running the filter code
> - using ISE 13.4/ Vivado run Top.v on the generated .txt file
> - the output matrix is output to another .txt file
#### Viewing the output image
> - run post_processing.m on the output .txt file 
> - the image with edges detected is saved as result_img.txt

### Experiments performed:
| Input Image | Output Image |
| ----------- | ------------  |
| ![title](https://github.com/susiejojo/Sobel_filter/blob/master/Reports/Inputs%26Matlab_codes/chess.png)      | ![title](https://github.com/susiejojo/Sobel_filter/blob/master/Reports/Outputs/output_chess.png)        |
| ![title](https://github.com/susiejojo/Sobel_filter/blob/master/Reports/Inputs%26Matlab_codes/sbl.jpg)   | ![title](https://github.com/susiejojo/Sobel_filter/blob/master/Reports/Outputs/output.png)         |

### Area, power, delay statistics:
- Area Report: https://github.com/susiejojo/Sobel_filter/blob/master/Reports/Reports/area_stats.txt
- Power Report: https://github.com/susiejojo/Sobel_filter/blob/master/Reports/Reports/power_rep.png
- Delay Report: https://github.com/susiejojo/Sobel_filter/blob/master/Reports/Reports/delay_stats.txt
