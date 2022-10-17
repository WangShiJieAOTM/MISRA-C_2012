### DCL02-C Use visually distinct identifiers

**使用视觉清晰的标识符**

有一些字符在视觉上很难区分:

|character|           similar character            |
|:---:|:--------------------------------------:|
|0(zero)| O(capital o),Q(capital q),D(capital d) |
|1(one)|      l(lowercase L),I(capital i)       |
|2(two)|              Z(capital z)              |
|5(five)|              S(capital s)              |
|8(eight)|              B(capital b)              |
|n(lowercase N)|             h(lowercase H)             |
|m(lowercase M)|      rn(lowercase R,lowercase N)       |

Noncompliant Code Example:

In file foo.h

```C
int id_O;
```

In file bar.h

```C
int id_0;
```

当foobar.c同时#include了foo.h和bar.h时,这两个变量很有可能认错

Compliant Solution:

In file foo.h:

```C
int id_a;
```

In file bar.h:

```C
int id_b;
```





