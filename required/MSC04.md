### MSC04-C. Use comments consistently and in a readable fashion

**使用注释的时候要保持一致性和可读性**

不要在注释里面使用/*

```C
/* 注释无意中省略了结束注释标记
security_critical_function();
/* Some other comment */
```

Compliant Solution (Preprocessor):

```C
#if 0  /*
        * Use of critical security function no
        * longer necessary.
        */
security_critical_function();
/* Some other comment */
#endif
```

别留带代码的注释 用条件宏语句来代替

Compliant Solution (Compiler):

```C
if (0) {  /*
           * Use of critical security function no
           * longer necessary, for now.
           */
  /*NOTREACHED*/
  security_critical_function();
  /* Some other comment */
}
```

↑这种方法运用了编译器会删除不可能执行代码的特性也可以完成同样的功能

下面列举了一些稀烂的注释:

```C

// */          /* Comment, not syntax error */

f = g/**//h;   /* Equivalent to f = g / h; */

//\
i();           /* Part of a two-line comment */

/\
/ j();         /* Part of a two-line comment */


/*//*/ l();    /* Equivalent to l(); */

m = n//**/o
+ p;           /* Equivalent to m = n + p; */

a = b //*divisor:*/c
+d;            /*
                * Interpreted as a = b/c + d; in c90
                * compiler and a = b + d; in c99 compiler.
                */
```

Compliant Solution:

```C
/* Nice simple comment */
 
int i; /* Counter */
```


