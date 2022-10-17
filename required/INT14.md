### INT14-C. Avoid performing bitwise and arithmetic operations on the same data

**对一些数据要避免使用位运算和算术运算**

Noncompliant Code Example(Left Shift):

```C
unsigned int x = 50;
x += (x << 2) + 1;
```

尽管这是一种有效的操作，但移位的结果取决于整数类型的底层表示形式，因此是由实现定义的。此外，代码的可读性也降低了。

Compliant Solution:

```C
unsigned int x = 50;
x = 5 * x + 1;
```

Noncompliant Code Example(Right Shift):

如果是负数的话可能会产生错误的结果

```C
int x = -50;
x >>= 2;
```

Compliant Solution:

```C
int x = -50;
x /= 4;
```

没有相当充分的限定 比如unsigned,且在确保完全正确的情况下才使用位运算,
否则尽量不使用,而且位运算的使用可能使得代码难以阅读