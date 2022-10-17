### EXP11-C. Do not make assumptions regarding the layout of structures with bit-fields

**不要假设的结构体的布局和位域**

Noncompliant Code Example:

```C
struct bf {
    unsigned int m1 : 8;
    unsigned int m2 : 8;
    unsigned int m3 : 8;
    unsigned int m4 : 8;
}; /* 32 bits total */
 
void function() {
    struct bf data;
    unsigned char *ptr;
    
    data.m1 = 0;
    data.m2 = 0;
    data.m3 = 0;
    data.m4 = 0;
    ptr = (unsigned char *)&data;
    (*ptr)++; /* Can increment data.m1 or data.m4 */
}
```

Compliant Solution:

```C
struct bf {
    unsigned int m1 : 8;
    unsigned int m2 : 8;
    unsigned int m3 : 8;
    unsigned int m4 : 8;
}; /* 32 bits total */

void function() {
    struct bf data;
    data.m1 = 0;
    data.m2 = 0;
    data.m3 = 0;
    data.m4 = 0;
    data.m1++;
}
```

结构体的位域的布局是不确定的,所以不要假设他们的布局

Noncompliant Code Example:

```C
struct bf {
    unsigned int m1 : 6;
    unsigned int m2 : 4;
};
 
void function() {
    unsigned char *ptr;
    struct bf data;
    data.m1 = 0;
    data.m2 = 0;
    ptr = (unsigned char *)&data;
    ptr++;
    *ptr += 1; /* What does this increment? */
}
```

Compliant Solution:

```C
struct bf {
    unsigned int m1 : 6;
    unsigned int m2 : 4;
};
 
void function() {
    struct bf data;
    data.m1 = 0;
    data.m2 = 0;
    data.m2 += 1;
}
```

取决于编译器的实现,位域的布局是不确定的,所以不要假设他们的布局
