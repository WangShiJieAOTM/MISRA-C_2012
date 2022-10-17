### DCL01-C Do not reuse variable names in subscopes
**不要在子作用域中重用变量名**

Noncompliant Code Example:

```C
#include <stdio.h>
  
static char msg[100];
static const size_t msgsize = sizeof( msg);
 
void report_error(const char *str) {
  char msg[80];
  snprintf(msg, msgsize, "Error: %s\n", str);
  /* ... */
}
 
int main(void) {
  /* ... */
  report_error("some error");
  
  return 0;
}
```

在子作用域(函数report_error())中使用了和全局作用域中相同的变量名msg。这样做会导致全局变量msg被隐藏，从而导致错误。

Compliant Solution:

```C
#include <stdio.h>
  
static char message[100];
static const size_t message_size = sizeof( message);
 
void report_error(const char *str) {
  char msg[80];
  snprintf(msg, sizeof( msg), "Error: %s\n", str);
  /* ... */
}
 
int main(void) {
  /* ... */
  report_error("some error");
  
  return 0;
}
```

一般来说,标识符的声明区域越大,标识符的名称就应该更详细,通过在全局和本地使用不同的变量名,编译器迫使开发人员使用变量名更加精确和详细的变量名。






