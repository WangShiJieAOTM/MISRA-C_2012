### INT07-C. Use only explicitly signed or unsigned char type for numeric values

**使用显式的signed或signed char类型对数字类型**

Noncompliant Code Example:

```C
char c = 200;
int i = 1000;
printf("i/c = %d\n", i/c);
```

char 类型在计算时默认为signed类型,所以当c的值为200时,它会被转换为-56,所以i/c的值为-17

Compliant Solution:

```C
unsigned char c = 200;
int i = 1000;
printf("i/c = %d\n", i/c);
```

这样出来的结果i/c就为5了