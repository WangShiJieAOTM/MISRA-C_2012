### DCL10-C. Maintain the contract between the writer and caller of variadic functions

**维护可变形参数函数的调用者和编写者之间的约定**

下面这个例子通过输入一串数字并以 -1 结尾告诉程序结束输入,如果编写者和调用者之间没有约定,那么程序就会出错

```C
enum { va_eol = -1 };
 
unsigned int average(int first, ...) {
  unsigned int count = 0;
  unsigned int sum = 0;
  int i = first;
  va_list args;
 
  va_start(args, first);
 
  while (i != va_eol) {
    sum += i;
    count++;
    i = va_arg(args, int);
  }
 
  va_end(args);
  return(count ? (sum / count) : 0);
}
```

Noncompliant Code Example:

```C
int avg = average(1, 4, 6, 4, 1);
```

Compliant Solution:

```C
int avg = average(1, 4, 6, 4, 1, va_eol);
```

其中va_eol是一个全局参数







  

