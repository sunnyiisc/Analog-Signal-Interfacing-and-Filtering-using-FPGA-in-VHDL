# Analog-Signal-Interfacing-and-Filtering-using-FPGA-in-VHDL
Reading the digitized values of an analog signal connected to ADC input on Spartan 3E board, doing some digital filtering on the samples and providing the output through DAC on board. Displaying both the input and output on an Oscilloscope. You can also use Pmod ADC with BASYS3 Board.

--------------------------------------
## Reference Documents:

- [Design_Details](Design_Details.md)
- [Component_Schematics](Component_Schematics.md)
- [Filter_Simulation_Results](Filter_Simulation_Results.md)
- [Practical_Results](Practical_Results.md)

--------------------------------------
## Source Code and Desiged Blocks
- Main Source Code [Filter_main](RTL_Code/Filter_main.vhd)

- Components Source Code:
  - Clock Divider [clk_divider](RTL_Code/clk_divider.vhd)
  - ADC Controller [XADC_Comp](RTL_Code/XADC_Comp.vhd)
  - DAC Controller [DA2_Comp](RTL_Code/DA2_Comp.vhd)
  - FIR Filter [Filter_comp](RTL_Code/Filter_Comp.vhd)
 
- Testbench:
  - Main Testbench [filter_main_tb](RTL_Code/filter_main_tb.vhd)

- Filter Standalone Code:
  - FIR Filter RTL Code [Filter_fir](Filter_Code/Filter_fir.vhd)
  - Filter Testbench [filter_tb_2](Filter_Code/filter_tb_2.vhd)
--------------------------------------
## Bitstream file:

[Filter_main.bit](Bitstream_Generated)

Bitstream is generated for Digilent Basys 3 FPGA board.

Basys 3 Constraint File [constraints_basys3.xdc](RTL_Code/constraints_basys3.xdc)

--------------------------------------
## Block Diagram of the Complete Design
![Block_Schematic](https://user-images.githubusercontent.com/47363228/169643419-c0cc3717-fb2a-4f8b-ba70-cf85a99f698f.png)

## Complete Setup (Wiring Connections):
![IMG_20190504_165441_Marked](https://user-images.githubusercontent.com/47363228/169650105-3eb97283-62ab-40ff-9401-fd28e024fedf.jpg)

