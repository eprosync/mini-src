library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram512by32 is 
    port(
        Read, Write : in std_logic;
        Data : inout std_logic_vector(31 downto 0);
        Address : in std_logic_vector(8 downto 0)
    );
end entity;

architecture behavior of ram512by32 is
    type mem_type is array (0 to 511) of std_logic_vector(31 downto 0);
    signal mem : mem_type := (others => (others => '0'));
begin
    process (Read, Write, Address)
    begin
        if Read = '1' and Write = '0' then
            Data <= mem(to_integer(unsigned(Address)));
        elsif Read = '0' and Write = '1' then
            mem(to_integer(unsigned(Address))) <= Data;
        end if;
    end process;
end architecture;