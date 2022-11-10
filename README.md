# VHDL_CodeCoverageReportSample
- Tutorials how to coverage data from verilog file into the report web-based.
- This is an example how to coverage data from verilog testbench file into html-based, which will be used later to indicate its content on the web-based.
- This tutorial is based on the instructions by Tomin Abraham [Verilog Code Coverage](https://www.youtube.com/watch?v=vkzd5ckQ5ZQ).
- What we have to do 1st is to choose the right directory of the verilog file and testbench file to work on these 2 files.
## Step 1: Map the library
```
vmap (library name) (library name)
```
## Step 2: Compile the design and testbench
``` 
vlog -coveropt 3 +cover +acc (file name(design)).v (file name(testbench)).v
```
## Step 3: Run the simulation for code coverage
```
vsim -coverage -vopt (library name).(module name(testbench)) -c -do "coverage save -onexit -directive -codeAll (report name).ucdb; run -all"
```
## Step 4: Export the code into html file
```
vcover report -html (report name).ucdb
```
## Step 5 (Optional): If the index.html file doesn't appear in the file covhtml report then you have to follow these step
``` 
vcover report -html (report name)
```
```
vsim -coverage -vopt (library name).(module name(testbench)) -c -do "coverage save -onexit -directive -codeAll (report name).ucdb; run -all"
```
``` 
vcover report -html (report name).ucdb
```
## Step 6: Open the covhtml file and click the index.html, the final report will be opened on the website based.
The final result should be looked as the below :
![final_rel_rp16](https://user-images.githubusercontent.com/96186749/201160947-8412b6a9-a199-42ff-b6f8-cd9e702bdcf8.png)
