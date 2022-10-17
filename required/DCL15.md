### DCL15-C. Declare file-scope objects or functions that do not need external linkage as static

**定义不需要外部链接的文件域对象或函数为静态**

Noncompliant Code Example:

```C
enum { MAX = 100 };

int helper(int i) {
/* Perform some computation based on i */
}

int main(void) {
    size_t i;
    int out[MAX];
    
    for (i = 0; i < MAX; i++) {
        out[i] = helper(i);
    }
    /* ... */

}
```

Compliant Solution:

```C
enum {MAX = 100};
 
static int helper(int i) {
  /* Perform some computation based on i */
}
 
int main(void) {
    size_t i;
    int out[MAX];
    
    for (i = 0; i < MAX; i++) {
    out[i] = helper(i);
    }
    
    /* ... */
 
}
```

这样helper()对象就不会被其他文件访问到了。

  

