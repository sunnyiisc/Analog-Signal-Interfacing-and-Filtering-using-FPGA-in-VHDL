----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2019 22:43:55
-- Design Name: 
-- Module Name: clk_freq_divideby16 - Behavioral
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

entity clk_divider is
    Port ( clk : in STD_LOGIC;
           clkby2 : out STD_LOGIC;
           clkby16: out std_logic
         );
end clk_divider;

architecture Behavioral of clk_divider is

signal count : STD_LOGIC_VECTOR (11 downto 0) :="000000000000";

begin

    process (clk)
    begin
    
        if (clk'event and clk = '1') then
            count<=count+1;
            
            clkby2<=count(0);
            clkby16<=count(4);
            
        end if;
        
     end process;
            
end Behavioral;
