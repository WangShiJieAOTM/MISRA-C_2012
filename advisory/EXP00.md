### EXP00-C. Use parentheses for precedence of operation

**使用括号来限定操作优先级**

Noncompliant Code Example:

```C
x & 1 == 0 --> x & (1 == 0) --> (x & 0)
```

Compliant Solution:

```C
(x & 1) == 0
```

Noncompliant Code Example:

```C
x + (y * z)
}
```

不需要括号
Compliant Solution:

```C
x + y * z
```
