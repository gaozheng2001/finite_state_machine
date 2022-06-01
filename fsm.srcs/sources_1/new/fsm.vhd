----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/20 21:43:40
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           input : in STD_LOGIC;
           output : out STD_LOGIC);
end fsm;

architecture Behavioral of fsm is
type state_type is (s0, s1, s2, s3);
signal state, state_next : state_type;
begin
clk_pro: process(CLK, RESET)is
begin
    if RESET = '1' then
        state <= s0;
    elsif (CLK'event and clk = '1')then
        state <= state_next;
    end if;
end process clk_pro;

control_pro: process(state, input) is
begin
case state is
    when s0 => 
        output <= '0';
        if input = '1' then
            state_next <= s1;
        else state_next <= s0;
        end if;
    when s1 => 
        output <= '0';
        if input = '1' then
            state_next <= s1;
        else state_next <= s2;
        end if;
    when s2 => 
        if input = '1' then
            state_next <= s3;
            output <= '1';
        else 
            state_next <= s0;
            output <= '0';
        end if;
    when s3 => 
        output <= '1';
        state_next <= s3;
end case;
end process control_pro;
end Behavioral;
