----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/20 22:14:40
-- Design Name: 
-- Module Name: tb_fsm - Behavioral
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

entity tb_fsm is
--  Port ( );
end tb_fsm;

architecture Behavioral of tb_fsm is
    component fsm 
    port(
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           input : in STD_LOGIC;
           output : out STD_LOGIC
    );
    end component;
    
    --input 
    signal CLK : std_logic:='0';
    signal RESET : std_logic:='0';
    signal input : std_logic:='0';
    
    --output 
    signal output : std_logic:='0';
    
    constant per : time:= 10 us;
    constant testinput : std_logic_vector(8 downto 0):= "001110111";
begin
uut: fsm
port map(
    CLK => CLK,
    RESET => RESET,
    input => input,
    output => output
);

clk_pro: process
begin
    CLK <= '0';
    wait for per/2;
    CLK <= '1';
    wait for per/2;
end process;

reset_pro: process
begin
    RESET <= '1';
    for i in 1 to 2 loop
    wait until CLK = '1';
    end loop;
    RESET <= '0';
    wait;
end process;

in_pro: process
begin
    for i in 0 to 8 loop
    input <= testinput(8 - i);
    wait for per;
    end loop;
end process;

end Behavioral;
