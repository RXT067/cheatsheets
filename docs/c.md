---
title: C
category: C
layout: 2017/sheet
tags: [Featured]
updated: 2019-12-19
keywords:
  - C
  - Programming
  - Programming Language
  - Statically typed
---

This page is in development, NOT TO BE USED FOR TRAINING!!

FIXME: Check spelling

FIXME: check definition of words used

FIXME: More info
C programming is statically typed programming language

See [ISO-9899](http://iso-9899.info/wiki/The_Standard)

See [Charter](http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2086.htm)

See [Wiki](ttp://www.iso-9899.info/)

See [Books](http://www.iso-9899.info/wiki/Books)

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
            largest = numbers[i];
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

if `CHAR_BIT` is 8 then there's room for 8 value bits in a char. -> Char can be imterpreted as `11111111` but not as `111111111` assuming that `char` converts words into an integer (FIXME: fact check)

Those are usually defined in limits.h or in float.h
- Unix considers using `{FLT,DBL}_{MIN,MAX}` as legacy [unreliable_reference(fixme)](https://stackoverflow.com/a/5834690)

**Unsigned** datatypes sets minimal value of said data-type on `0` (Only rational numbers are allowed)
```c
   unsigned int <identifier> = 10;
// ^^^^^^^^
```

See [implementation-defined constants](http://man7.org/linux/man-pages/man0/limits.h.0p.html)

See [Reference for datatypes](https://www.programiz.com/c-programming/c-data-types)

FIXME: Implement https://www.youtube.com/watch?v=k12BJGSc2Nc&list=PLHTh1InhhwT75gykhs7pqcR_uSiG601oh&index=56

### identifiers
identifiers can be following `abcefghijklmnopqrstuvwxyzABCDEFGHCIJKLMNOPQRSTUVWXYZ_0123456789`, but they can NOT start with a number.

Standard method to write identifiers is to use camel case -> `somethingIsNothing` (notice that first letter is lowercase)

```c
int something = 12;
//  ^^^^^^^^^ identifier

int 5something = 15;
//  ^ ILLEGAL! (?)
```

### Integer (Rational/Negative numbers)
Stores rational and negative numbers from INT_MIN to INT_MAX.

Integer can not store irational number (FIXME: fact-check)

These limits are for example `-2147483647` to `2147483647`.
- Defined in `limits.h` on unix. [ref](http://man7.org/linux/man-pages/man0/limits.h.0p.html0)
- Defined in `limits.h` on windows. [ref](https://docs.microsoft.com/en-us/cpp/cpp/integer-limits?view=vs-2019)

```c
// Stores number 10 in <identifier> variable
int <identifier> = 10;
```

### Double (fixme: summary?)
FIXME: 
```
a double can store values below 0 e.g. -DBL_MAX or -2
it can also store values outside that range (positive and negative infinity)
and other values that are not a number
and it's not guaranteed to be 64 bits
and I don't know what "not compatible with 32-bit systems" means, but I'm pretty sure it's wrong
```

<!-- Stores decimal numbers from DBL_MIN to DBL_MAX in 64-bit address (Not compatible with 32-bit systems). -->

These limits are for example `0.000000` to `179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000.000000`.

(FIXME: Rephrase)<br>
Double can represent gigantic numbers as floats, but you lose a ton of precision!
- `DBL_MAX - 1` will probably be the exact same number as `DBL_MAX`, because doubles don't have enough precision to differentiate between even different whole numbers when they're that size
- the biggest double you can store where you can still differentiate between single whole number changes is something like 2^52-1, or 4503599627370495 (assuming IEEE double precision floating points)

```c
// Stores number 10.5 in <identifier> variable
double <identifier> = 10.5;
//                       ^^^^ decimal
```

### Float (fixme: summary?)
FIXME: 
```
"Float is 32-bit number used for storing decimal numbers" nope and nope
there's no guarantee it's 32 bits, and it doesn't store decimals
e.g. 0.1 cannot be represented exactly by a float
```
<!-- Float is 32-bit number used for storing decimal numbers from FLT_MIN to FLT_MAX. -->

These limits are for example `0.000000` to `340282346638528859811704183484516925440.000000`

```c
// Stores number 10.5 in <identifier> variable
float <identifier> = 10.5;
//                   ^^^^ decimal
```

FLT_MIN and FLT_MAX are defined in `float.h` on unix where using these in `limits.h` is marked as legacy. (?)

### Character
Characters (char) stores characters as integer value (i.e: A = 65)

```c
char <identifier> = 'A'; 

printf("%c\n", <identifier>); // Returns A
printf("%i\n", <identifier>); // Returns 65 (On amd64)
```

A == 64 is standardized as ASCII (and later extended into other things, including Unicode) but C can run on systems that don’t use ASCII or even support it as an option. They’re relatively rare, but they’re out there (EBCDIC on IBM mainframes for instance)

See [Conversion characters](http://www.asciitable.com/)

Sidenote: Conversion characters reference mensiones those as Decimel as in "base-10 numbering system" not "floating point type" (https://en.wikipedia.org/wiki/Decimal)

### Character array

FIXME: More info requried
```c
char <identifier>[] = "char "
```

### Boolean
Stores true or false in a variable

```c
#include <stdbool.h> // Has to be declared otherwise compiler won't recognize booleans

// Stores 1 or 0 for false in <identifier>
bool <identifier> = false;
```

(FIXME: Rephrase)<br>
In binary 0 is considered as false and 1 is considered as true this depends on the environment used for example UNIX considers 0 as true and 1~255 as false.

### long long

FIXME: Add info

### unsigned long long

FIXME: Add info

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

- [Formatted output conversion](https://linux.die.net/man/3/printf)<br>
- [Printf wikipedia](https://en.wikipedia.org/wiki/Printf_format_string)

## Operators

FIXME: implement

Operators are used to create an expression

```c
// This is binary operator becuase plus has two operands
init x = 5 + 5;
//       ^^^^^ - Expression
//       ^   ^ - Operands
//         ^   - Operator
```

There are unary, binary and tonary operators

    **unary** = Works on one operand<br>
    **binary** = Works on two operands<br>
    **tonary** = Works on three operands<br>


### Aritmetical operators (math)
`+` = Addition

```c
// 10 is added by 7 -> value '17' is stored in variable 'x'
int x = 10 + 7;
```

`-` = Substraction

```c
// 10 is subtracked by 3 -> value '7' is stored in variable 'x'
int x = 10 - 3;
```

`/` = Division

```c
// 10 is devided by 2 -> value '5' is stored in variable 'x'
int x = 10 / 2;
```

`*` = Multiplication

```c
// 10 is multiplied by 2 -> value '20' is stored in variable 'x'
int x = 10 * 2;
```

`%` = Modules (reminder of interage devision)<br>

```c
// 10 devided by 3 and whatever is left is set as value of variable 'x' (Stores '1' in variable 'x')
int x = 10 % 3;
```

### Comparison Operators
`==` = Equal

```c
// If variable 'c' stores a value equal to value '5' -> Return true -> Outputs "Hello World"
if(c == 5)
{
    printf("%s\n", "Hello World");
}
```

`!=` = Not Equal

```c
// If variable c stores a value not equal to value '5' -> Return true -> Outputs "Hello World"
if(c != 5)
{
    printf("%s\n", "Hello World");
}
```

`<` = Left is smaller then right

```c
// If variable c stores value smaller then value '5' -> Return true -> Outputs "Hello World"
if(c < 5)
{
    printf("%s\n", "Hello World");
}
```

`>` = Left is bigger then right

```c
// If variable c stores value bigger then value '5' -> Return true -> Outputs "Hello World"
if(c > 5)
{
    printf("%s\n", "Hello World");
}
```

`<=` = Left is smaller or equal to right

```c
// If variable c stores value smaller or equal to value '5' -> Return true -> Outputs "Hello World"
if(c <= 5)
{
    printf("%s\n", "Hello World");
}
```

`>=` = Left is bigger or equal to right

```c
// If variable c stores value bigger or equal to value '5' -> Return true -> Outputs "Hello World"
if(c >= 5)
{
    printf("%s\n", "Hello World");
}
```


#### Unary minus

FIXME: More info needed

```c
int x = 5;
int y = -x;

// x is 5
// y is -5
```

### Increments

FIXME: Info needed

```c
// `a++;` is same as `a = a + 1;`
a = 5;
b = 5;
b = a++;
//   ^^ - this is evaulated after variable 'a'

// a is 5
// b is 6
```

### Pre-Increments

FIXME: Info needed

```c
b = 5;
a = 5;
b = ++a;
//  ^^ this is evaulated prior to variable 'a'

// b is 6
// a is 6
```

See [Operator precedence](https://en.cppreference.com/w/c/language/operator_precedence)

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
