### DCL11-C. Understand the type issues associated with variadic functions

**理解可变形参数函数相关的类型问题**

Noncompliant Code Example:

直接的类型错误:

```C
const char *error_msg = "Error occurred";
/* ... */
printf("%s:%d", 15, error_msg);
```

Compliant Solution:

```C
const char *error_msg = "Error occurred";
/* ... */
printf("%d:%s", 15, error_msg);
```

参数宽窄化的错误:

Noncompliant Code Example:

```C
long long a = 1;
const char msg[] = "Default message";
/* ... */
printf("%d %s", a, msg);
```

Compliant Solution:

```C 
long long a = 1;
const char msg[] = "Default message";
/* ... */
printf("%lld %s", a, msg);
```

string 为空的情况:

Noncompliant Code Example:

```C
char* string = NULL;
printf("%s %d\n", string, 1);
```

Compliant Solution:

```C
char* string = NULL;
printf("%s %d\n", (string ? string : "null"), 1);
```







  

