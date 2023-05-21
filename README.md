# Custom 8 Bit Computer on an FPGA
-

## Required Software and Hardware

To use this project, you will need the following software and hardware:

### Software

- [Quartus](https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/overview.html): The Quartus software is used for designing and programming the FPGA.

- [ModelSim](https://www.mentor.com/company/higher_ed/modelsim-student-edition): ModelSim is a simulation and debugging tool used for verifying FPGA designs.

- [USB Blaster Driver](https://www.intel.com/content/www/us/en/programmable/support/support-resources/drivers/dri-index.html): The USB Blaster driver is required to communicate with the DE0-CV development board.

- [Python](https://www.python.org/): Python is used for additional functions such as the [sprite generation](https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/tree/main/pythonScripts/bitMapConverter) and [Map generation](https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/tree/main/pythonScripts/tiledMapConverter) .

- [Tiled Map Editor](https://www.mapeditor.org/): Tiled Map Editor is a map creation tool used for designing and editing tile-based game maps.

### Hardware

- DE0-CV Development Board: The DE0-CV development board is the target FPGA board for this project.

- PS2 Keyboard: A PS2 keyboard is required for user input to the FPGA design.

- VGA Capable Display: A display with VGA input capability is needed to view the output of the FPGA design.

Note: Ensure that you have the necessary software installed and the hardware components available before proceeding with this project.

# GUIDE
## Writing software
Since the computer uses the Z80 microprocessor a resource is needed to flash the rom on the board with custom software. To do this [SDCC](https://sdcc.sourceforge.net/) was used which allows users to write software in more syntactically familiar C as well as Z80 assembly. This is compiled to assembly. However the IHX files output are not in the correct format for the computer so a bash file is used to abstract this from the user.

Examples of SDCC programs can be found in the [SDCC](https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/tree/main/SDCC) section of the project.

Example use of bashscript which compiles C file, formats the output and loads it to the rom directory

<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/bashScript.png" />

## RTL Simulation

Once the program has been written and loaded to the rom. an RTL simulation can be done using Modelsim.

- Run analysis and synthesis 
<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/analysis.png" />

<br>
- Run RTL Simulation
<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/rtlButton.png" />

<br>
- Add the respective wires and registers you wish to observe
<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/vgaTiming.png" />

## Designing tile maps

Additional helper scripts can be used to design the game maps and the sprites to be used. Since the computer has a custom memory layout the [bitMap](https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/tree/main/pythonScripts/bitMapConverter) script to convert a 16x16 sprite map to binary.

Example sprite map
<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/spriteMap.png" />

Python program
<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/pythonScript1.png" />

Additionally when designing the map the user can use the [Tiled Map Editor](https://www.mapeditor.org/) to design worlds and convert them to the memory layout needed for the computer using the python [script](https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/tree/main/pythonScripts/tiledMapConverter)

<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/tiledImage.png" />

Save the map as game.tls and the script will automatically convert it to hex and load it to the VRAM hex files.  

<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/pythonScript2.png" />


## Loading program onto device

Once the design is compiled and software has been written switch the board to "program" via the sw10 on the board.

<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/switch.png" />

Using Quartus programmer set to "Active serial programming" and USB Blaster press start to load the design to the FPGA
<img src="https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/raw/main/README_images/programmer.png" />

Switch SW10 back to RUN

This [video](https://www.youtube.com/watch?v=GjGi8DC8lgs) shows an example program running.


# acknowledgements
Many thanks to my supervisor Pavel Gladyshev for their guidance and support in this project.
