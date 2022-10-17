### MSC07-C. Detect and remove dead code

**找出和删除没用的代码**

Noncompliant Code Example:

```C
int func(int condition) {
    char *s = NULL;
    if (condition) {
        s = (char *)malloc(10);
        if (s == NULL) {
           /* Handle Error */
        }
        /* Process s */
        return 0;
    }
    /* ... */
    if (s) {
        /* This code is never reached */
    }
    return 0;
}
```

Compliant Solution:

```C
int func(int condition) {
    char *s = NULL;
    if (condition) {
        s = (char *)malloc(10);
        if (s == NULL) {
           /* Handle error */
        }
        /* Process s */
    }
    /* ... */
    if (s) {
        /* This code is now reachable */
    }
    return 0;
}
```

因为在 s = (char *)malloc(10); 这里如果malloc失败了,那么s就是NULL,所以在if(s)这里是不会执行的
所以我们可以删除 if(s == NULL)里面的return 0;

注意一下,下面的这种情况不属于dead code

```C 
typedef enum { Red, Green, Blue } Color;
const char* f(Color c) {
  switch (c) {
    case Red: return "Red";
    case Green: return "Green";
    case Blue: return "Blue";
    default: return "Unknown color";   /* Not dead code */
  }
}
 
void g() {
  Color unknown = (Color)123;
  puts(f(unknown));
}
```


