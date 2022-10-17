### PRE00-C. Prefer inline or static functions to function-like macros

**优先使用内联函数和静态函数而非类函数宏**

Noncompliant Code Example:

这里i被多加了几次

```C
#define CUBE(X) ((X) * (X) * (X))
  
void func(void) {
  int i = 2;
  int a = 81 / CUBE(++i);
  /* ... */
}
```

Compliant Solution:

```C
inline int cube(int i) {
return i * i * i;
}

void func(void) {
int i = 2;
int a = 81 / cube(++i);
/* ... */
}
```

Noncompliant Code Example:

在这个例子中  宏函数展开后回合局部变量count冲突导致本来想让全局变量count增加的结果变成了没有增加

```C
size_t count = 0;
 
#define EXEC_BUMP(func) (func(), ++count)
 
void g(void) {
  printf("Called g, count = %zu.\n", count);
}
 
void aFunc(void) {
  size_t count = 0;
  while (count++ < 10) {
    EXEC_BUMP(g);
  }
}
```

```C
size_t count = 0;
 
void g(void) {
  printf("Called g, count = %zu.\n", count);
}
 
typedef void (*exec_func)(void);
inline void exec_bump(exec_func f) {
  f();
  ++count;
}
 
void aFunc(void) {
  size_t count = 0;
  while (count++ < 10) {
    exec_bump(g);
  }
}
```

