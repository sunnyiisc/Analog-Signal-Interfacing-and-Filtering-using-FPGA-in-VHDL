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

## Filter Design
For Filter design we have taken help from MATLAB where we have used filter designer for finding the coefficients of the filter design.

### Filter Specifications:
- Sampling frequency: 50khz
- Cut off frequency: 100 Hz
- Stop frequency: 10KHz
- Filter type: FIR lowpass Equiripple
- Pass band magnitude gain: 0db
- Stop band magnitude attenuation: 80db

#### Filter Designer Window of Matlab
<img width="451" alt="image" src="https://user-images.githubusercontent.com/47363228/169580050-0c410421-1889-4333-a4c3-391cc3acfb20.png">

Now from the quantization block in the filter designer the word lengths and fractional lengths are considered to find the coefficients. 
- Input word length: 12
- Input fractional word length: 10
- Output word length:  12
- Output fractional word length: 10
- Accumulator word length :12
- Product word length: 24

<img width="451" alt="image" src="https://user-images.githubusercontent.com/47363228/169580276-4ecab8ca-ee5d-4879-a29b-796dd133c423.png">

#### Generated Coefficients
![image](https://user-images.githubusercontent.com/47363228/169580357-f19c2382-1b59-44fa-8c0b-3d067c499fb1.png)

As these coefficients must be multiplied with the delayed input signal sequence as described in the data path they are converted in the fixed-point format as explained below:
Say, 
- B = generated coefficient from the filter
- C = B*2^10 
- D = nearest round figure of B
- E = 12-bit binary format of D 
This E is the stored in as signed 12-bit in the constant called coefficient in VHDL program.  

### Block Diagram of the Filter
<img width="265" alt="image" src="https://user-images.githubusercontent.com/47363228/169580603-4220a3f4-2d96-4e20-9720-5e898e9b45cb.png">

### Data-Path of the Designed Filter in VHDL
![image](https://user-images.githubusercontent.com/47363228/169580662-41dac785-d8c5-441b-8f34-885acc4fbc6c.png)


## ADC Controller
The inbuilt ADC of the BASYS-3 board is instantiated and is utilized for the analog input of the signal to be filtered. This is available in the JXADC port of the BASYS-3 board.
The XADC core within the Artix-7 is a dual channel 12-bit analog-to-digital converter capable of operating at 1 MSPS. Either channel can be driven by any of the auxiliary analog input pairs connected to the JXADC header. The XADC core is controlled and accessed from a user design via the Dynamic Reconfiguration Port (DRP). The DRP also provides access to voltage monitors that are present on each of the FPGA's power rails, and a temperature sensor that is internal to the FPGA.

