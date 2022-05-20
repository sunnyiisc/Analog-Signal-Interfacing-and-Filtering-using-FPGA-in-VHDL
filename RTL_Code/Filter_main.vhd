----------------------------------------------------------------------------------
-- Company: IISc
-- Engineer: Supantha Sen
-- 
-- Create Date: 01.05.2019 12:12:13
-- Design Name: ADC-DAC Interfacing by Filtering
-- Module Name: Filter_main - Behavioral
-- Project Name: FPGA Mini-Project
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Filter_main is
    Port ( 
            clk                 : in std_logic;
            rst                 : in std_logic;
            clk_out, nsync: out std_logic;
            d1                  : out std_logic;
            d2                  : out std_logic;
            clk_enable          : in std_logic;
            --adc_data            : out std_logic_vector(15 downto 0);
            JXADC               : in std_logic_vector(7 downto 0)
            
         );
end Filter_main;

architecture Behavioral of Filter_main is

component clk_divider is
    Port ( clk    : in STD_LOGIC;
           clkby2 : out STD_LOGIC;
           clkby16: out std_logic
          );
end component;

component DA2_Comp is
    Port ( 

     --General usage
       CLK      : in std_logic;    -- System Clock (50MHz)     
       RST      : in std_logic;
     
     --Pmod interface signals
       D1       : out std_logic;
       D2       : out std_logic;
       CLK_OUT  : out std_logic;
       nSYNC    : out std_logic;
        
     --User interface signals
       DATA1    : in std_logic_vector(11 downto 0);
       DATA2    : in std_logic_vector(11 downto 0);
       START    : in std_logic; 
       DONE     : out std_logic
              
        );
end component;

component XADC_Comp is
    Port ( clk        : in  STD_LOGIC;
           adc_data   : out STD_LOGIC_VECTOR (15 downto 0);
           JXADC      : in  STD_LOGIC_VECTOR (7 downto 0);
           start      : in std_logic);
end component;

component Filter_Comp IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         in_data                         :   IN    std_logic_vector(11 DOWNTO 0); 
         out_data                        :   OUT   std_logic_vector(11 DOWNTO 0)  
         );

END component;

signal q : STD_LOGIC :='0';
signal done, clk1,clk2, clk_out_m, nsync_m, rst_m, D1_m, D2_m, start : std_logic;
signal data1_m,data2_m, op_filter  : std_logic_vector(11 downto 0);
signal adc_data_m : std_logic_vector(15 downto 0); --
--signal jxadc_m : std_logic_vector(7 downto 0);
signal count : STD_LOGIC_VECTOR (11 downto 0) :="000000000000";

begin
d1<=D1_m;
d2<=D2_m;
--done<=done_m;
clk_out<=clk_out_m;
nsync<=nsync_m;
--adc_data<=adc_data_m;
--JXADC<=jxadc_m;

--clk_enable<='1';
--data_adc<=data1_m;
--data_adc(11 downto 0)<=data1_m;

--CLOCK_DIVIDER--
c1: clk_divider port map( clk => clk,
                          clkby2 => clk1,
                          clkby16 => start
                        );
--DAC CONTROLLER--                          
c2: DA2_Comp port map(  --General usage
                        CLK      => clk1,    
                        RST      => rst,
     
                        --Pmod interface signals
                        D1       => D1_m,
                        D2       => D2_m,
                        CLK_OUT  => clk_out_m,
                        nSYNC    => nsync_m,
        
                        --User interface signals
                        DATA1    => data1_m,
                        DATA2    => data2_m,
                        START    => start,
                        DONE     => done );
--ADC CONTROLLER--                       
c3: XADC_Comp port map( clk        =>   clk1,                   
                        adc_data   =>   adc_data_m,
                        JXADC      =>   JXADC,
                        start      =>   start);
--FILTER--                        
c4: Filter_Comp port map(    clk            =>  start, 
                             clk_enable     =>  clk_enable,   
                             reset          =>  rst, 
                             in_data        =>  adc_data_m(15 downto 4), 
                             out_data       =>  op_filter  
                             );


data1_m <= op_filter when (clk_enable='1') else
           adc_data_m(15 downto 4) when (clk_enable='0');
           
--process (clk1)          
--    begin
    
--        if (clk1'event and clk1 = '1') then
--            data1_m<=op_filter;                
--        end if;
        
--end process;

--ONLY DAC RAMP OUTPUT CHECKING
                        
--process (clk1)          
--    begin
    
--        if (clk1'event and clk1 = '1') then
--            count<=count+1;
            
--            if (count="111111111111") then
--                --q<=not(q);
--                count<="000000000000";
--            end if;
            
--        end if;
        
--        data1_m<=count;
--        data2_m<=not(count);
        
--end process;

end Behavioral;
