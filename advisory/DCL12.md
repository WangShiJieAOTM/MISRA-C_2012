### DCL12-C. Implement abstract data types using opaque types

**使用不透明数据类型来实现抽象数据类型**

Noncompliant Code Example:

在#include"string_m.h"后string_mx类型对于用户是完全可见的,因此，程序员更有可能直接操作结构中的字段，这违反了信息隐藏和数据封装的软件工程原则，增加了开发不正确或不可移植代码的可能性。

```C
struct string_mx {
    size_t size;
    size_t maxsize;
    unsigned char strtype;
    char *cstr;
};

typedef struct string_mx string_mx;

/* Function declarations */
extern errno_t strcpy_m(string_mx *s1, const string_mx *s2);
extern errno_t strcat_m(string_mx *s1, const string_mx *s2);
/* ... */
```

Compliant Solution:

string_mx在string_m.h中完全可见,其在包含的内部头文件做了具体实现,但是他对于用户而言是不透明的,因此,用户不能直接操作结构中的字段,只能通过函数来操作

```C
struct string_mx;
typedef struct string_mx string_mx;

/* Function declarations */
extern errno_t strcpy_m(string_mx *s1, const string_mx *s2);
extern errno_t strcat_m(string_mx *s1, const string_mx *s2);
/* ... */
```

in internal header file:

```C
struct string_mx {
  size_t size;
  size_t maxsize;
  unsigned char strtype;
  char *cstr;
};
```






  

