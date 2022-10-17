### EXP10-C. Do not depend on the order of evaluation of subexpressions or the order in which side effects take place

**不要依赖于子表达式的求值顺序或副作用的发生顺序**

Noncompliant Code Example:

这个代码的g的值可能为1,也可能为2,这取决于编译器的实现

```C
#include <stdio.h>
 
int g;
 
int f(int i) {
    g = i;
    return i;
}
 
int main(void) {
    int x = f(1) + f(2);
    printf("g = %d\n", g);
    /* ... */
    return 0;
}
```

Compliant Solution:

这个代码的g的值一定为2,分开写确保了函数调用的顺序

```C
#include <stdio.h>

int g;

int f(int i) {
    g = i;
    return i;
}

int main(void) {
    int x = f(1);
    x += f(2);
    printf("g = %d\n", g);
    /* ... */
    return 0;
}
```

