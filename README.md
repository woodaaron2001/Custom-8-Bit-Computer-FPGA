# Custom 8 Bit Computer on an FPGA
-

## Required Software and Hardware

To use this project, you will need the following software and hardware:

### Software

- [Quartus](https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/overview.html): The Quartus software is used for designing and programming the FPGA.

- [USB Blaster Driver](https://www.intel.com/content/www/us/en/programmable/support/support-resources/drivers/dri-index.html): The USB Blaster driver is required to communicate with the DE0-CV development board.

- [Python](https://www.python.org/): Python is a programming language used for running scripts and interacting with the FPGA design.

- [Tiled Map Editor](https://www.mapeditor.org/): Tiled Map Editor is a map creation tool used for designing and editing tile-based game maps.

### Hardware

- DE0-CV Development Board: The DE0-CV development board is the target FPGA board for this project.

- PS2 Keyboard: A PS2 keyboard is required for user input to the FPGA design.

- VGA Capable Display: A display with VGA input capability is needed to view the output of the FPGA design.

Note: Ensure that you have the necessary software installed and the hardware components available before proceeding with this project.

# GUIDE
## Writing software
Since the computer uses the Z80 microprocessor a resource is needed to flash the rom on the board with custom programs. To do this [SDCC](https://sdcc.sourceforge.net/) was used which allows users to write software in more syntactically familiar C. This is compiled to assembly. However the IHX files output are not in the correct format for the computer so a bash file is used to abstract this from the user.

Examples of SDCC programs can be found in the [SDCC](https://csgitlab.ucd.ie/fyp-fpga/fpga-files/-/tree/main/SDCC) section of the project.

Example use of bashscript which compiles C file, formats the output and loads it to the rom directory
![Alt Text](path/to/image.jpg)

## RTL Simulation

Once the program has been written and loaded to the rom. an RTL

## Designing tile maps



## Loading program onto device




# acknowledgements
Many thanks to my supervisor Pavel Gladyshev for their guidance and support in this project.
