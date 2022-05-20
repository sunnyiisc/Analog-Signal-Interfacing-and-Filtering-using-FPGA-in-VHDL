----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2019 10:07:15 PM
-- Design Name: 
-- Module Name: Filter_FIR_1 - Behavioral
-- Project Name: 
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

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Filter_Comp IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         in_data                         :   IN    std_logic_vector(11 DOWNTO 0); 
         out_data                        :   OUT   std_logic_vector(11 DOWNTO 0)  
         );

END Filter_Comp;

architecture Behavioral of Filter_Comp is

  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF signed(11 DOWNTO 0);

  CONSTANT b0                         : signed(11 DOWNTO 0) := "000000000100";
  CONSTANT b1                         : signed(11 DOWNTO 0) := "000000001110";
  CONSTANT b2                         : signed(11 DOWNTO 0) := "000000100010";
  CONSTANT b3                         : signed(11 DOWNTO 0) := "000000111101";
  CONSTANT b4                         : signed(11 DOWNTO 0) := "000001010111";
  CONSTANT b5                         : signed(11 DOWNTO 0) := "000001101000";
  CONSTANT b6                         : signed(11 DOWNTO 0) := "000001101000";
  CONSTANT b7                         : signed(11 DOWNTO 0) := "000001010111";
  CONSTANT b8                         : signed(11 DOWNTO 0) := "000000111101";
  CONSTANT b9                         : signed(11 DOWNTO 0) := "000000100010";
  CONSTANT b10                        : signed(11 DOWNTO 0) := "000000001110";
  CONSTANT b11                        : signed(11 DOWNTO 0) := "000000000100";
  
-- Signals
-- product signals
   SIGNAL delay_pipeline                   : delay_pipeline_type(0 TO 11);
   SIGNAL pro_1                            : signed(23 DOWNTO 0);
   SIGNAL pro_2                            : signed(23 DOWNTO 0);
   SIGNAL pro_3                            : signed(23 DOWNTO 0);
   SIGNAL pro_4                            : signed(23 DOWNTO 0);
   SIGNAL pro_5                            : signed(23 DOWNTO 0);
   SIGNAL pro_6                            : signed(23 DOWNTO 0);
   SIGNAL pro_7                            : signed(23 DOWNTO 0);
   SIGNAL pro_8                            : signed(23 DOWNTO 0);
   SIGNAL pro_9                            : signed(23 DOWNTO 0);
   SIGNAL pro_10                           : signed(23 DOWNTO 0);
   SIGNAL pro_11                           : signed(23 DOWNTO 0);
   SIGNAL pro_12                           : signed(23 DOWNTO 0);
   
-- adder signals     
   SIGNAL sum_1                            : signed(11 DOWNTO 0);
   SIGNAL sum_2                            : signed(11 DOWNTO 0);
   SIGNAL sum_3                            : signed(11 DOWNTO 0);
   SIGNAL sum_4                            : signed(11 DOWNTO 0);
   SIGNAL sum_5                            : signed(11 DOWNTO 0);
   SIGNAL sum_6                            : signed(11 DOWNTO 0);
   SIGNAL sum_7                            : signed(11 DOWNTO 0);
   SIGNAL sum_8                            : signed(11 DOWNTO 0);
   SIGNAL sum_9                            : signed(11 DOWNTO 0);
   SIGNAL sum_10                           : signed(11 DOWNTO 0);
   SIGNAL sum_11                           : signed(11 DOWNTO 0);
   
-- output register
   SIGNAL output_register                  : signed(11 DOWNTO 0);   
   
begin
    delay_pipeline_process : process(clk,reset)
    begin
        if reset = '1'  then 
             delay_pipeline (0 to 5) <= (others =>(others => '0'));
        elsif (clk' event and clk = '1') then 
        if clk_enable = '1' then 
             delay_pipeline(0) <= signed(in_data);
             delay_pipeline(1 to 11) <= delay_pipeline(0 to 10);
        end if;
        end if;
    end process delay_pipeline_process;
        
 -- product blocks       
        
        pro_1 <= delay_pipeline(0)*b0 ;
        pro_2 <= delay_pipeline(1)*b1 ;
        pro_3 <= delay_pipeline(2)*b2 ;
        pro_4 <= delay_pipeline(3)*b3 ;
        pro_5 <= delay_pipeline(4)*b4 ;
        pro_6 <= delay_pipeline(5)*b5 ;
        pro_7 <= delay_pipeline(6)*b6 ;
        pro_8 <= delay_pipeline(7)*b7 ;
        pro_9 <= delay_pipeline(8)*b8 ;
        pro_10 <= delay_pipeline(9)*b9 ;
        pro_11 <= delay_pipeline(10)*b10 ;
        pro_12 <= delay_pipeline(11)*b11 ;
        
  
 --  summer blocks
        sum_1  <=  pro_1(21 downto 10) + pro_2(21 downto 10); 
        sum_2  <=  pro_3(21 downto 10) + sum_1(11 downto 0) ;
        sum_3  <=  pro_4(21 downto 10) + sum_2(11 downto 0) ;
        sum_4  <=  pro_5(21 downto 10) + sum_3(11 downto 0) ;
        sum_5  <=  pro_6(21 downto 10) + sum_4(11 downto 0) ; 
        sum_6  <=  pro_7(21 downto 10) + sum_5(11 downto 0) ; 
        sum_7  <=  pro_8(21 downto 10) + sum_6(11 downto 0) ; 
        sum_8  <=  pro_9(21 downto 10) + sum_7(11 downto 0) ; 
        sum_9  <=  pro_10(21 downto 10) + sum_8(11 downto 0) ; 
        sum_10 <=  pro_11(21 downto 10) + sum_9(11 downto 0) ; 
        sum_11 <=  pro_12(21 downto 10) + sum_10(11 downto 0) ; 
        
 --  output register process
    output_register_process : process(clk,reset)
    begin
        if reset = '1'  then 
             output_register <= (others => '0');
        elsif (clk' event and clk = '1') then 
        if clk_enable = '1' then 
             output_register <= sum_11(11 downto 0) ;
        end if;
        end if;
    end process output_register_process ;
    
    out_data <= std_logic_vector(output_register);
         
end Behavioral;
