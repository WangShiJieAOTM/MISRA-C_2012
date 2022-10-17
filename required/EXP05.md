### EXP05-C. Do not cast away a const qualification

**如果有对const对象进行修改情况,就不要让他成为const**

Noncompliant Code Example:

```C
void remove_spaces(const char *str, size_t slen) {
  char *p = (char *)str;
  size_t i;
  for (i = 0; i < slen && str[i]; i++) {
    if (str[i] != ' ') *p++ = str[i];
  }
  *p = '\0';
}
```

```C
const int vals[3] = {3, 4, 5};
memset(vals, 0, sizeof(vals));
```

Compliant Solution:

```C
void remove_spaces(char *str, size_t slen) {
  char *p = str;
  size_t i;
  for (i = 0; i < slen && str[i]; i++) {
    if (str[i] != ' ') *p++ = str[i];
  }
  *p = '\0';
}
```

```C
int vals[3] = {3, 4, 5};
memset(vals, 0, sizeof(vals));
```

