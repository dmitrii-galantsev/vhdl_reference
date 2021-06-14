# Chapter 1

VHDL Reference
Written by Dmitrii Galantsev
Some info taken from Effective Coding with VHDL

# 0. Design units

## 0.1 Entity
Describes the system or component from an external point of view.
```vhdl
entity EXAMPLE_ENT is
  generic (
    g_clk_rate : integer := 80);
  port (
    sig_in  : in std_logic;
    sig_out : out std_logic
    );
end EXAMPLE_ENT;
```

## 0.2 Architecture
Describes the internal operation of a module. Specifies behavior.
```vhdl
architecture rtl of EXAMPLE_ENT is
  -- signal declaration
  signal my_sig : std_logic := '0';

  -- May also contain:
  -- ... function declaration
  -- ... procedure declaration
  -- ... alias declaration
begin
  -- concurrent signal assignment
  -- only 1 when my_sig != sig_in
  my_sig  <= sig_in;
  sig_out <= my_sig xor sig_in;

  -- May also contain:
  -- ... concurrent procedure call
  -- ... concurrent assert
  -- ... process statement
  -- ... generate statement statement
end rtl;
```

## 0.3 Package declaration
Groups a collection of declarations that can be reused in other designs.
Specifies no behavior.
```vhdl
package PACKAGE_NAME is
  constant C : integer;
end PACKAGE_NAME;
```

## 0.3.1 Package body
Contains the implementation of a package. Specifies behavior.
Statements can only be inside subprograms. Concurrent statements cannot be used in here.
```vhdl
package body PACKAGE_NAME is
  constant C : integer := 200;
end PACKAGE_NAME;
```

