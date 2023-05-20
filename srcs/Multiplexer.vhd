library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sel : in STD_LOGIC;
           u : out STD_LOGIC);
end Multiplexer;

architecture Behavioral of Multiplexer is
begin
u<=a when sel='0' else
    b when sel='1' else 'X';
end Behavioral;
