### MEM05-C. Avoid large stack allocations

**避免大的堆分配特别是在栈的增长可以被攻击者控制或影响的情况下。**

Noncompliant Code Example:

下面这个例子,攻击者可以通过传入一个很大的bufsize来导致栈溢出:

```C
int copy_file(FILE *src, FILE *dst, size_t bufsize) {
    char buf[bufsize];
    
    while (fgets(buf, bufsize, src)) {
        if (fputs(buf, dst) == EOF) {
            /* Handle error */
        }
    }
    return 0;
}
```

Compliant Solution:

这个例子中,如果传入的bufsize很大 会在malloc中失败,从而导致程序退出

```C
int copy_file(FILE *src, FILE *dst, size_t bufsize) {
    if (bufsize == 0) {
    /* Handle error */
    }
    char *buf = (char *)malloc(bufsize);
    if (!buf) {
        /* Handle error */
    }

    while (fgets(buf, bufsize, src)) {
        if (fputs(buf, dst) == EOF) {
            /* Handle error */
        }
    }
    /* ... */
    free(buf);
    return 0;
}
```

Noncompliant Code Example:

```C
unsigned long fib1(unsigned int n) {
    if (n == 0) {
        return 0;
    }
    else if (n == 1 || n == 2) {
        return 1;
    }
    else {
        return fib1(n-1) + fib1(n-2);
    }
}
```

Compliant Solution:

```C

unsigned long fib2(unsigned int n) {
    if (n == 0) {
        return 0;
    }
    else if (n == 1 || n == 2) {
        return 1;
    }
    
    unsigned long prev = 1;
    unsigned long cur = 1;
    
    unsigned int i;
    
    for (i = 3; i <= n; i++) {
        unsigned long tmp = cur;
        cur = cur + prev;
        prev = tmp;
    }
    return cur;
}
```

经典斐波那契数列的迭代实现,避免了大量的栈分配

