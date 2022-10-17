### DCL07-C. Include the appropriate type information in function declarators

**在函数声明器中包含适当的类型信息**

Noncompliant Code Example:

```C
int max(a, b)
        int a, b;
{
    return a > b ? a : b;
}
```

谁TM会这样写啊.......

Compliant Solution (Non-Prototype-Format Declarators):

```C
int max(int a, int b) {
    return a > b ? a : b;
}
```

***这一节没啥卵用***




  

