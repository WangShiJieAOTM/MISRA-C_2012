### DCL20-C. Explicitly specify void when a function accepts no arguments

**当函数不接受参数需要显式指定void**

Noncompliant Code Example:

```C
/* In foo.h */
void foo();

/* In foo.c */
void foo() {
    int i = 3;
    printf("i value: %d\n", i);
}
/* In caller.c */
#include "foo.h"

foo(3);
```

Compliant Solution:

```C
/* In foo.h */
void foo(void);

/* In foo.c */
void foo(void) {
    int i = 3;
    printf("i value: %d\n", i);
}

/* In caller.c */
#include "foo.h"

foo(3);
```
 
gcc默认不检查,g++默认检查,void foo()历史遗留问题

在c语言里 void foo()表示可以传入任何数量的参数
    
void foo(void)表示不接受任何参数
