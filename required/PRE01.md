### PRE01-C. Use parentheses within macros around parameter names

**在宏中使用圆括号括住参数名**

Noncompliant Code Example:

```C
#define CUBE(I) (I * I * I)

int a = 81 / CUBE(2 + 1);

int a = 81 / (2 + 1 * 2 + 1 * 2 + 1);  /* Evaluates to 11 */
```

Compliant Solution:

```C
#define CUBE(I) ( (I) * (I) * (I) )
int a = 81 / CUBE(2 + 1);
```
