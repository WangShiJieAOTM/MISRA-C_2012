### DCL13-C. Declare function parameters that are pointers to values not changed by the function as const

**将指向未更改的值的函数参数设为const**

Noncompliant Code Example:

```C
void foo(const int *x) {
    if (x != NULL) {
        *x = 3; /* Compiler should generate diagnostic message */
    }
    /* ... */
}
```

```C
char *strcat_nc(char *s1, char *s2);
 
char *c_str1 = "c_str1";
const char *c_str2 = "c_str2";
char c_str3[9] = "c_str3";
const char c_str4[9] = "c_str4";
 
strcat_nc(c_str3, c_str2);  /* Compiler warns that c_str2 is const */
strcat_nc(c_str1, c_str3);  /* Attempts to overwrite string literal! */
strcat_nc(c_str4, c_str3);  /* Compiler warns that c_str4 is const */
```

Compliant Solution:

```C
void foo(const int * x) {
    if (x != NULL) {
        printf("Value is %d\n", *x);
    }
    /* ... */
}
```

```C
char *strcat(char *s1, const char *s2);

char *c_str1 = "c_str1";
const char *c_str2 = "c_str2";
char c_str3[9] = "c_str3";
const char c_str4[9] = "c_str4";

strcat(c_str3, c_str2);

/* Args reversed to prevent overwriting string literal */
strcat(c_str3, c_str1);
strcat(c_str4, c_str3);  /* Compiler warns that c_str4 is const */
```

  

