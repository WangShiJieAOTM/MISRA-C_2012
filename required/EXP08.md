### EXP08-C. Ensure pointer arithmetic is used correctly

**确保指针的计算被使用正确**

Noncompliant Code Example:

```C
int buf[INTBUFSIZE];
int *buf_ptr = buf;

while (havedata() && buf_ptr < (buf + sizeof(buf))) {
    *buf_ptr++ = parseint(getdata());
}
```

Compliant Solution:

```C
int buf[INTBUFSIZE];
int *buf_ptr = buf;

while (havedata() && buf_ptr < (buf + INTBUFSIZE)) {
    *buf_ptr++ = parseint(getdata());
}



int buf[INTBUFSIZE];
int *buf_ptr = buf;
 
while (havedata() && buf_ptr < &buf[INTBUFSIZE]) {
    *buf_ptr++ = parseint(getdata());
}
```

Noncompliant Code Example:

```C
struct big {
    unsigned long long ull_1; /* Typically 8 bytes */
    unsigned long long ull_2; /* Typically 8 bytes */
    unsigned long long ull_3; /* Typically 8 bytes */
    int si_4; /* Typically 4 bytes */
    int si_5; /* Typically 4 bytes */
};
/* ... */
  
int f(void) {
    size_t skip = offsetof(struct big, ull_2);
    struct big *s = (struct big *)malloc(sizeof(struct big));
    if (!s) {
        return -1; /* Indicate malloc() failure */
    }
    
    memset(s + skip, 0, sizeof(struct big) - skip);
    /* ... */
    free(s);
    s = NULL;
    
    return 0;
}
```

Compliant Solution:

```C
struct big {
  unsigned long long ull_1; /* Typically 8 bytes */
  unsigned long long ull_2; /* Typically 8 bytes */
  unsigned long long ull_3; /* Typically 8 bytes */
  int si_4; /* Typically 4 bytes */
  int si_5; /* Typically 4 bytes */
};
/* ... */
  
int f(void) {
    size_t skip = offsetof(struct big, ull_2);
    struct big *s = (struct big *)malloc(sizeof(struct big));
    if (!s) {
        return -1; /* Indicate malloc() failure */
    }
    memset((char *)s + skip, 0, sizeof(struct big) - skip);
    /* ... */
    free(s);
    s = NULL;
    return 0;
}
```

警惕指针的加法  他可能会造成意想不到的后果


