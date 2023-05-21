# Custom 8 Bit Computer on an FPGA
-

# Required software and hardware


# GUIDE
### Writing software
Since the computer uses the Z80 microprocessor a resource is needed to flash the rom on the board with custom programs. To do this [SDCC](https://sdcc.sourceforge.net/) was used which allows users to write software in more syntactically familiar C. This is compiled to assembly. However the IHX files output are not in the correct format for the computer so a bash file is used to abstract this from the user.

Examples of SDCC programs can be found in the [SDCC](https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/tree/main/SDCC) section of the project.

Example use of bashscript which compiles C file, formats the output and loads it to the rom directory
![Alt Text](path/to/image.jpg)

### Designing tile maps

### RTL Simulation

### Loading program onto device




# acknowledgements
Many thanks to my supervisor Pavel Gladyshev for their guidance and support in this project.
