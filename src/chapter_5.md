# Chapter 5


# Loops

## Examples
Simple for-loop

```vhdl
variable my_slv : std_logic_vector := x"0000_0000";
for i in 0 to 31 loop
    my_slv(i) := '1';
end loop;
```

For-loop with range

```vhdl
variable my_slv : std_logic_vector := x"0000_0000";
for i in my_slv'low to my_slv'high loop
    my_slv(i) := '1';
end loop;
```

For-loop with types

link: <https://www.edaplayground.com/x/M6Ak>

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
end testbench; 

architecture tb of testbench is

type color_t is (RED, GREEN, BLUE, PURPLE, MAGENTA, BLACK, WHITE);
type color_array_t is array (color_t) of integer range 0 to 255;

begin
  process
    variable my_color_array : color_array_t;
  begin
    for color in color_t loop
      my_color_array(color) := 255;
    end loop;
    
    -- simple check
    assert my_color_array(RED) = 255;
    
    -- check all colors
    for color in color_t loop
      assert my_color_array(color) = 255;
    end loop;
    
    -- terminate test
    assert false report "end of test";
    wait;
  end process;
end tb;
```
