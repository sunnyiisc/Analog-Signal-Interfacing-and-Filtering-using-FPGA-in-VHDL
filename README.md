# Analog-Signal-Interfacing-and-Filtering-using-FPGA-in-VHDL
Reading the digitized values of an analog signal connected to ADC input on Spartan 3E board, doing some digital filtering on the samples and providing the output through DAC on board. Displaying both the input and output on an Oscilloscope. You can also use Pmod ADC with BASYS3 Board.

--------------------------------------
## Reference Documents:

- [Design_Details](Design_Details.md)
- [Component_Schematics](Component_Schematics.md)

--------------------------------------
## Source Code and Desiged Blocks
- Main Source Code [Filter_main](RTL_Code/Filter_main.vhd)
- Components Source Codes:
  - Clock Divider [clk_divider](RTL_Code/clk_divider.vhd)
  - ADC Controller [XADC_Comp](RTL_Code/XADC_Comp.vhd)
  - DAC Controller [DA2_Comp](RTL_Code/DA2_Comp.vhd)
  - FIR Filter [Filter_comp](RTL_Code/Filter_Comp.vhd)
- Testbench:
  - Filter Testbench
  - Main Testbench [filter_main_tb](RTL_Code/filter_main_tb.vhd)

--------------------------------------
## Block Diagram of the Complete Design
![Block_Schematic](https://user-images.githubusercontent.com/47363228/169643419-c0cc3717-fb2a-4f8b-ba70-cf85a99f698f.png)

## Complete Setup (Wiring Connections):
![IMG_20190504_165441_Marked](https://user-images.githubusercontent.com/47363228/169650105-3eb97283-62ab-40ff-9401-fd28e024fedf.jpg)

