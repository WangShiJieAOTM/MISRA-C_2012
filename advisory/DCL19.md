### DCL19-C. Minimize the scope of variables and functions

**最小化变量和函数的作用域**

Noncompliant Code Example:

```C
unsigned int count = 0;
 
void counter() {
  if (count++ > MAX_COUNT) return;
  /* ... */
 
}
```

Compliant Solution:

```C
void counter() {
static unsigned int count = 0;
if (count++ > MAX_COUNT) return;
/* ... */

}
```

Noncompliant Code Example:

```C
size_t i = 0;

for (i=0; i < 10; i++){
/* Perform operations */
}
```

Compliant Solution:

```C
for (size_t i=0; i < 10; i++) {
/* Perform operations */
}
```

internal function in scope
Noncompliant Code Example:

```C
int f(int i) {
  /* Function definition */
}
 
int g(int i) {
  int j = f(i);
  /* ... */
}
```

Compliant Solution:

```C
static int f(int i) {
/* Function definition */
}

int g(int i) {
int j = f(i);
/* ... */
}
```


