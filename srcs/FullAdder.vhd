library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is
signal p,g: STD_LOGIC;
begin
p<=a xor b;
g<=a and b;
s<=p xor cin;
cout<=g or (p and cin);
end Behavioral;
