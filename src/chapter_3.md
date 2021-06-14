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
