### PRE07-C. Avoid using repeated question marks

**避免使用连续的问号**

|     |        |
|:---:|:------:|  
| ??= |   #    |
| ??) |   ]    |
| ??! | &#124; |
| ??( |   [    |
| ??' |   ^    |
| ??> |   }    |
| ??/ |   \\   |
| ??< |   {    |
| ??- |   ~    |

Noncompliant Code Example:

```C
// What is the value of a now??/
a++;
```

Compliant Solution:

```C
// What is the value of a now? ?/
a++;
```

Noncompliant Code Example:

```C
size_t i = /* Some initial value */;
if (i > 9000) {
   if (puts("Over 9000!??!") == EOF) {
     /* Handle error */
   }
}
```

Compliant Solution:

```C
size_t i = /* Some initial value */;
/* Assignment of i */
if (i > 9000) {
   if (puts("Over 9000!?""?!") == EOF) {
     /* Handle error */
   }
}
```

一些编译器默认是开启三合一运算符的，这个运算符是C99标准中的一部分，它的作用是可以在一个表达式中使用三个运算符

```C
#include<stdio.h>

int main()??<
printf("%s\n","HelloWorld");
??>
```

↑这种鬼代码是可以编译运行的:

```shell
$ gcc -std=c99 -o test test.c
```
