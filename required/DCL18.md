### DCL18-C. Do not begin integer constants with 0 when specifying a decimal value

**在指定十进制值时，整数常量不以0开头**

Noncompliant Code Example:

```C
i_array[0] = 2719;
i_array[1] = 4435;
i_array[2] = 0042;
```

Compliant Solution:

```C
i_array[0] = 2719;
i_array[1] = 4435;
i_array[2] =   42;
```

容易产生误会
