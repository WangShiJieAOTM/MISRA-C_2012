### DCL16-C. Use "L," not "l," to indicate a long value

**使用"L"而不是"l"去声明long 值**

Noncompliant Code Example:

```C
printf("Sum is %ld\n", 1111 + 111l);
```

Compliant Solution:

```C
printf("Sum is %ld\n", 1111 + 111L);
```

容易弄混

