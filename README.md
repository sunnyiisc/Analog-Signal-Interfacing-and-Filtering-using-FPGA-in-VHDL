# Analog-Signal-Interfacing-and-Filtering-using-FPGA-in-VHDL
Reading the digitized values of an analog signal connected to ADC input on Spartan 3E board, doing some digital filtering on the samples and providing the output through DAC on board. Displaying both the input and output on an Oscilloscope. You can also use Pmod ADC with BASYS3 Board.

--------------------------------------
## Block Diagram of the Entire Design
![Block_Schematic](https://user-images.githubusercontent.com/47363228/167665816-a53d3f17-6cf4-4c12-add6-043ee9e49a36.png)

## DAC Controller Design

### Block Diagram of the DAC Controller
![DA2_Component_block](https://user-images.githubusercontent.com/47363228/167687300-52f6f06f-aeb4-4eb3-8cc7-eb6e3ebcb082.JPG)

### Data stream needed for DAC Conversion
![DA2_data](https://user-images.githubusercontent.com/47363228/167687413-66dc8b44-8bfa-433d-90c9-ad8ce6dfa9f3.JPG)

### State Diagram of the DAC Controller
![DA2_State Diagram](https://user-images.githubusercontent.com/47363228/167687670-f5ef661c-2a91-421f-b8b4-e90e38fa3766.JPG)
