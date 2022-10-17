### MSC12-C. Detect and remove code that has no effect or is never executed

**检查和删除那些无效或从来不会执行的代码**

Noncompliant Code Example (Assignment):

```C
int a;
int b;
/* ... */
a == b;
```

Compliant Solution:

```C
int a;
int b;
/* ... */
a = b;
```

Noncompliant Code Example (Dereference):

先让p++再解引用不一定有意义

```C
int *p;
/* ... */
*p++;
```

Compliant Solution:

```C
int *p;
/* ... */
++p;

or:

int *p;
/* ... */
(*p)++;
```   

另一种可能是p用于引用内存映射的设备。在这种情况下，应该将变量p声明为volatile。

```C
volatile int *p;
/* ... */
(void) *(p++);
```

Noncompliant Code Example (if/else if):

```C
if (param == 1)
   openWindow();
 else if (param == 2)
   closeWindow();
 else if (param == 1) /* Duplicated condition */
   moveWindowToTheBackground();
 ```

Compliant Solution:

```C
if (param == 1)
   openWindow();
 else if (param == 2)
   closeWindow();
 else if (param == 3)
   moveWindowToTheBackground();
```

注意:下面这个例子是合法的,因为getc()函数会改变流的状态

```C
if (getc() == ':')
    readMoreInput();
else if (getc() == ':')
    readMoreInput();
else if (getc() == ':')
    readMoreInput();
```

Noncompliant Code Example (logical operators):

```C
if (a == b && a == b) { // if the first one is true, the second one is too
  do_x();
}
if (a == c || a == c ) { // if the first one is true, the second one is too
  do_w();
}
```

Compliant Solution (logical operators):

```C
if (a == b) {
  do_x();
}
if (a == c) {
  do_w();
}
```

Noncompliant Code Example (Unconditional Jump):

无条件的跳转语句通常是没有用的

```C
#include <stdio.h>
  
for (int i = 0; i < 10; ++i) {
  printf("i is %d", i);
  continue;  // this is meaningless; the loop would continue anyway
}
```

Compliant Solution(Unconditional Jump):

```C
#include <stdio.h>
  
for (int i = 0; i < 10; ++i) {
   printf("i is %d", i);
}
#include <stdio.h>
  
for (int i = 0; i < 10; ++i) {
   printf("i is %d", i);
}
```

