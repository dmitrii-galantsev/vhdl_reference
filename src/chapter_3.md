# Chapter 3


# 10.5 The *wait* Statement

The wait statement suspends the execution of a process until a condition is met. The
condition may include:
- A **sensitivity list**, causing the process to resume when an event occurs in one of the
signals in the list;
- A **condition expression**, causing the process to resume when the expression evaluates to true ;
- A **time expression**, causing the process to resume when the specified time has
elapsed.
The complete wait statement has the form: 
Sequential Statements 247
wait on *sensitivity_list* until *condition_expression* for *time_expression* ;
All three clauses are optional, so it is possible to write:

```vhdl
wait; -- This suspends the process indefinitely.
wait on clock, reset;
wait until clock;
wait for 10 ns;
wait on clock until reset for 100 ms;
```

## Examples
The expression will be evaluated whenever the value of clock changes; however, the
process will resume only if clock is '1' and reset is '0' .
```vhdl
wait on clock until clock = '1' and reset = '0';
```

If a sensitivity list is not specified with an on clause, then the wait statement will
have an implicit sensitivity list, composed of all signals present in the condition expression. Thus, the following two statements are equivalent:
```vhdl
wait on clock, reset until clock = '1' and reset = '0';
wait until clock = '1' and reset = '0';
```

## Notes

First, because only signals are included in the implicit sensitivity list, this causes a
problem when the condition expression uses only variables: the process never resumes
because the implicit sensitivity list is empty. Thus, the wait statement below would
never resume:
```vhdl
wait until some_variable = '1';
```
Second, a process always suspends when it reaches a wait statement; only then it
waits for an event on the sensitivity list. Because of this characteristic, a wait statement
like:
```vhdl
wait until some_signal = '1';
```
