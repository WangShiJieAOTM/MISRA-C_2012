### PRE06-C. Enclose header files in an include guard

**将头文件包含在头文件保护中**

Compliant Solution:

```C
#ifndef HEADER_H
#define HEADER_H
 
/* ... Contents of <header.h> ... */
 
#endif /* HEADER_H */
```

避免多个头文件被包含多次,出现重定义的情况
