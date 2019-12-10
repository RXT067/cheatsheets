---
title: gcc
category: gcc
layout: 2017/sheet
tags: [Featured]
updated: 2019-12-19
keywords:
  - Data Types
---

This page is in development, not to be used for training!

FIXME: More info
C programming is statically typed programming language

## Example
```c
#include <stdio.h>

// Comment
/* Comment */

// Return highest number in an array
int highestNumber(int numbers[], int size)
{
    int largest = numbers[0];
    for(int i = 1; i < size; i++)
    {
        if(numbers[i] > largest)
        {
            largest = ages[i];
        }
    }
    return largest;
}

int main() {
    int const size = 7;

    int numbers[size] = {8, 24, 8, 12, 4, 87, 13};

    printf("Highest Number is %d\n", highestNumber(numbers,size));

    return 0;
}
```

## Data types

Defined maximums depends per platform these are examples:
```
CHAR_BIT    :   8
CHAR_MAX    :   127
CHAR_MIN    :   -128
INT_MAX     :   2147483647
INT_MIN     :   -2147483648
DBL_MIN     :   0.000000
DBL_MAX     :   179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000
FLT_MIN     :   0.000000
FLT_MAX     :   340282346638528859811704183484516925440.000000
LONG_MAX    :   9223372036854775807
LONG_MIN    :   -9223372036854775808
SCHAR_MAX   :   127
SCHAR_MIN   :   -128
SHRT_MAX    :   32767
SHRT_MIN    :   -32768
UCHAR_MAX   :   255
UINT_MAX    :   4294967295
ULONG_MAX   :   18446744073709551615
USHRT_MAX   :   65535
```

Those are usually defined in limits.h or in float.h
- Unix considers using `{FLT,DBL}_{MIN,MAX}` as legacy [unreliable_reference(fixme)](https://stackoverflow.com/a/5834690)

**Unsigned** datatypes sets minimal value of said data-type on `0` (Only rational numbers are allowed)
```c
   unsigned int <identificator> = 10;
// ^^^^^^^^
```

See [implementation-defined constants](http://man7.org/linux/man-pages/man0/limits.h.0p.html)

<!-- FIXME: Implement https://www.youtube.com/watch?v=k12BJGSc2Nc&list=PLHTh1InhhwT75gykhs7pqcR_uSiG601oh&index=56 -->

### Identificators
Identificators can be following `abcefghijklmnopqrstuvwxyzABCDEFGHCIJKLMNOPQRSTUVWXYZ_0123456789`, but they can NOT start with a number.

Standard method to write identificators is to use camel case -> `somethingIsNothing` (notice that first letter is lowercase)

```c
int something = 12;
//  ^^^^^^^^^ identificator

int 5something = 15;
//  ^ ILLEGAL! (?)
```

### Integer
Stores rational and irational numbers from INT_MIN to INT_MAX.

These limits are for example `-2147483647` to `2147483647`.
- Defined in `limits.h` on unix. [ref](http://man7.org/linux/man-pages/man0/limits.h.0p.html0)
- Defined in `limits.h` on windows. [ref](https://docs.microsoft.com/en-us/cpp/cpp/integer-limits?view=vs-2019)

```c
// Stores number 10 in <identificator> variable
int <identificator> = 10;
```

### Double (Decimal)
Stores decimal numbers from DBL_MIN to DBL_MAX in 64-bit address (Not compatible with 32-bit systems).

These limits are for example `0.000000` to `179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000.000000`.

(FIXME: Rephrase)
Double can represent gigantic numbers as floats, but you lose a ton of precision!
- `DBL_MAX - 1` will probably be the exact same number as `DBL_MAX`, because doubles don't have enough precision to differentiate between even different whole numbers when they're that size
- the biggest double you can store where you can still differentiate between single whole number changes is something like 2^52-1, or 4503599627370495 (assuming IEEE double precision floating points)

```c
// Stores number 10.5 in <identificator> variable
double <identificator> = 10.5;
//                       ^^^^ decimal
```

### Float
Float is 32-bit number used for storing decimal numbers from FLT_MIN to FLT_MAX.

These limits are for example `0.000000` to `340282346638528859811704183484516925440.000000`

```c
// Stores number 10.5 in <identificator> variable
float <identificator> = 10.5;
//                      ^^^^ decimal
```

FLT_MIN and FLT_MAX are defined in `float.h` on unix where using these in `limits.h` is marked as legacy. (?)

### Character
Characters (char) stores characters as integer value (i.e: A = 65)

```c
char <identificator> = 'A'; 

printf("%c\n", <identificator>); // Returns A
printf("%i\n", <identificator>); // Returns 65
```

See [Conversion characters](http://www.asciitable.com/)

### Character array

FIXME: More info requried
```c
char <identificator>[] = "char "
```

### Boolean
Stores true or false in a variable

```c
#include <stdbool.h> // Has to be declared otherwise compiler won't recognize booleans

// Stores 1 or 0 for false in <identificator>
bool <identificator> = false;
```

(FIXME: Rephrase)
In binary 0 is considered as false and 1 is considered as true this depends on the environment used for example UNIX considers 0 as true and 1~255 as false.

## Print formatted (printf)

Printf is used in C lang to format string and return it as output.

```c
// Output string
printf("%s", "Hello World"); // Returns 'Hello World'

// Output value of variable
char something = "hello";
printf("%d", something); // Returns 'hello'

// Output interage stored in char
char something = 'A';
printf("%i, something); # Returns '64' (ASCII for 'A')
```

- [Formatted output conversion](https://linux.die.net/man/3/printf)
- [Printf wikipedia](https://en.wikipedia.org/wiki/Printf_format_string)

## Operators

FIXME: implement

## Logic

### Expressions
Expressions are any legal combination of code that returns a legal value.

```c
if (true && false || true) ...
//  ^^^^^^^^^^^^^^^^^^^^^ Expression
```

In C lang expressions are evaulated from left to right

```c
   if(true && false || true) ...
//    ^^^^^^^^^^^^^ - First
//    ^^^^^^^^^^^^^^^^^^^^^ - Second (true AND false is **false** -> **false** OR true is true)
```

### If statements
If statements are used to return an action depending on the logic provided in the expression.

```c
int something = 10;

// If variable something does NOT store a value 10
if(10 != something)
{
    action

// Else If if statement above is false and if variable something does store a value 10
} else if(10 == something)
{
    // In this example this would trigger
    action
// In case both if statements above return false
} else {
    action
};
```

If statements can also be written in a one line
```c
if (expression) action;
```

### For loops
Run the loop untill expression is false

For loops are usually initiated with expression based on initialization -> comparison -> update

Example of expression for for loop  `int i = 0; i <= 10; i++`
                                     ^^^^^^^^^ initialization
                                                ^^^^^^^ Comparison
                                                         ^^^ Update

Loop with this expression is going to run untill comparison returns false. (for 10 cycles in this example)

```c
for(expression)
{
    action
};
```

### While loop
While expression is true, run the loop

```c
while(i < 20)
{
    // code here
    i++;
};
```
