----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2019 16:20:03
-- Design Name: 
-- Module Name: filter_main_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity filter_main_tb is
--  Port ( );
end filter_main_tb;

architecture Behavioral of filter_main_tb is

component Filter_main is
    Port ( 
            clk                 : in std_logic;
            rst                 : in std_logic;
            clk_out, done, nsync: out std_logic;
            d1                  : out std_logic;
            d2                  : out std_logic;
            scl                 : inout std_logic;
            sda                 : inout std_logic
            
         );
end component;

signal clk, rst, clk_out, done, nsync, d1, d2, scl, sda : std_logic;
constant period: time :=10ns;

begin

uut: Filter_main port map (clk, rst, clk_out, done, nsync, d1, d2, scl, sda);

process
begin
    wait for 10ns;
    cloop: loop
    clk <= '0';
    wait for (period/2);
    clk <= '1';
    wait for (period/2);
    end loop;
end process;

process
begin
    wait for 10ns;
    rst <= '1';
    wait for 500ns;
    rst <= '0';
    sda <= 'H';
    scl <= 'H';
    wait;
end process;

end Behavioral;
