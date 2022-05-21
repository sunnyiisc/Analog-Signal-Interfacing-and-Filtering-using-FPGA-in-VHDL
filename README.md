# Analog-Signal-Interfacing-and-Filtering-using-FPGA-in-VHDL
Reading the digitized values of an analog signal connected to ADC input on Spartan 3E board, doing some digital filtering on the samples and providing the output through DAC on board. Displaying both the input and output on an Oscilloscope. You can also use Pmod ADC with BASYS3 Board.

--------------------------------------
## Reference Documents:

- [Design_Details](Design_Details.vhd)

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

## Block Diagram of the Complete Design
![Block_Schematic](https://user-images.githubusercontent.com/47363228/169643419-c0cc3717-fb2a-4f8b-ba70-cf85a99f698f.png)

## Schematic of the Designed Components
### Filter:
![Filter](https://user-images.githubusercontent.com/47363228/169643328-c5ce4298-bd55-4b5f-ab7c-8a33e639da3e.png)

### Clock-Divider:
![Clock_Divider_Component](https://user-images.githubusercontent.com/47363228/169643356-761f749a-a21b-4e0e-80aa-08daf10ea195.png)

### ADC-Controller:
![ADC_Component](https://user-images.githubusercontent.com/47363228/169643374-83016520-c73f-4b45-80c2-1e76a081be6a.png)

### DAC-Controller:
![DAC](https://user-images.githubusercontent.com/47363228/169643384-9eb97cb8-1ac2-405b-bc37-ec5a7b682ef6.png)

