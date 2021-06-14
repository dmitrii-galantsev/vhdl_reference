# Chapter 2
## 8.2.1 Literals
```vhdl
slv := "1100_0011"; -- Error: Character '_' not in enumeration type bit
slv := b"1100_0011"; -- OK: expands to "11000011", then gets assigned to slv

7x "7b" -- Expands to "1111011"

x"07ff_ffff" -- Expands to "00000111111111111111111111111111"
b"1100_0011" -- Expands to "11000011"
d"150_000_000" -- Expands to "1000111100001101000110000000"
```

## 8.2.2 Aggregates
```vhdl
type rgb_color_type is record
  red, green, blue: integer range 0 to 255 ;
end record ;
```

A record aggregate using positional association:
```vhdl
constant OXFORD_BLUE: rgb_color_type := (6, 13, 69);
```
A record aggregate using named association:
```vhdl
constant AQUAMARINE: rgb_color_type := (red => 97, green => 232, blue => 164);
```
A record aggregate using only the keyword others:
```vhdl
constant BLACK: rgb_color_type := (others => 0);
```
A record aggregate using named association and the keyword others:
```vhdl
constant NAVY_BLUE: rgb_color_type := (blue => 128, others => 0);
```
Mixed named and positional associations
(this is valid only for record aggregates, not for array aggregates):
```vhdl
constant SCARLET: rgb_color_type := (255, green => 33, others => 164);
```

```vhdl
signal a, b, sum: unsigned(WIDTH- 1 downto 0);
signal carry_out: std_ulogic ;
```
we could extract the carry bit from a sum by extending each operand by one bit and
then assigning the result to an aggregate:
```vhdl
(carry_out, sum) <= ('0' & a) + ('0' & b);
```

## 8.2.4 Aliases
```vhdl
assert << signal duv.main_controller.current_state: state_type >> = coin_return
 report "Unexpected FSM state" ;
```
We can use an alias to provide a shorter handle for the object:
```vhdl
alias duv_state is << signal duv.main_controller.current_state: state_type >> ;
assert duv_state = coin_return report "Unexpected FSM state" ;
```

Another common use is to create an alias for part of a composite object. In this
case, the original name will be an indexed name or a slice name. This can be used for
convenience or to document the meaning of a specific bit or field. In many cases, we
can move information from a comment to an alias, making the code more
self-documenting. In the following example, an alias named sign_bit is declared
for the most significant bit of signal alu_result :
```vhdl
signal alu_result: unsigned(31 downto 0);
alias sign_bit is alu_result(31);
```

Another use for an alias is to provide a different view of an object, as if it
had a different subtype or other constraints. This requires a different syntax,
in which we specify a
subtype in the alias declaration:
```vhdl
alias new_name: new_subtype is original_name;
```

Nonobject aliases are used similarly to object aliases, except for subprograms
and enumeration literals, which require a signature in the alias declaration.
When we write an alias for a subprogram, we must provide a signature describing
the types of its parameters and, for a function, its return value. A signature
is a VHDL construct that lists within square brackets the types of the
parameters and return value of a subprogram. The simplified syntax for a
subprogram alias is:
```vhdl
alias new_name is original_name [type_1, type_2, ... return type_n];
```
For example, suppose we want to create an alias for each version of subprogram
to_integer defined in numeric_std. The motivation is that the package
declares two overloaded versions, one for signed and the other for unsigned
parameters. Because there are two possible meanings, we cannot call the
function with a string literal as argument:
```vhdl
int := to_integer("11111111"); -- Error: Subprogram "to_integer" is ambiguous
```
However, we can create two aliases with different signatures:
```vhdl
alias int_from_sig is to_integer[signed return integer];
alias int_from_uns is to_integer[unsigned return integer];
```
Then each aliased subprogram can be used unambiguously with a string literal:
```vhdl
int := int_from_sig("11111111");
int := int_from_uns("11111111");
```

## 8.3 Attributes

Table 8.5 Predefined attributes
omitted. Page 174


3 ways of component instantiation
Figure 9.10

Subcomponent to be instantiated
```vhdl
entity adder is
  port (
    a, b: in integer;
    sum: out integer
  );
end;
```
