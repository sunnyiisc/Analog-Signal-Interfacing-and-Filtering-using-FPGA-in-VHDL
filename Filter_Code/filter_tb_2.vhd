LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

entity filter_tb_2 is
  
end  entity;

architecture behavior OF filter_tb_2 is

   signal clk : std_logic := '0';
   signal in_data : std_logic_vector(11 downto 0) := (others => '0');
   signal out_data : std_logic_vector(11 downto 0) := (others => '0');
   signal clk_enable, reset :  std_logic := '0';
   constant clk_period : time := 10 ns;
   
   begin
   
   -- Instantiate the Unit Under Test (UUT)
   uut: entity work.filter_fir PORT MAP (
          clk => clk ,
          in_data => in_data,
          out_data => out_data,
          clk_enable => clk_enable,
          reset => reset         
        );
   
   -- Clock process definitions
   Clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
   end process;
   
   -- Stimulus process
   stim_proc: process
   begin        
      wait for clk_period*2;
      reset <= '1';  
      clk_enable <= '0' ; 
      
      wait for clk_period*2 ;
      reset <= '0' ;
      wait for clk_period ; 
      clk_enable <= '1';
       
      wait for clk_period ;
      
      
      --  impulse input
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"200"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"000"; wait for clk_period*1;
      --  wait
      clk_enable <= '0' ;   
        
      wait for clk_period*2;  
      
      clk_enable <= '1';
      --  step input
      
        in_data <= x"000"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
        in_data <= x"100"; wait for clk_period*1;
            
      wait;
   end process;
   
end ; 
   
   
   