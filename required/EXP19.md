### EXP19-C. Use braces for the body of an if, for, or while statement

**在if、for或while语句的主体中使用大括号**

Noncompliant Code Example:

```C
int login;
 
if (invalid_login())
  login = 0;
else
  login = 1;

other:

int login;
 
if (invalid_login())
  login = 0;
else
  printf("Login is valid\n");  /* Debugging line added here */
  login = 1;                   /* This line always gets executed
                               /* regardless of a valid login! */
```

Compliant Solution:

```C

int login;

if (invalid_login()) {
    login = 0;
} else {
    login = 1;
}
```

结构体的位域的布局是不确定的,所以不要假设他们的布局

Noncompliant Code Example:

很容易出现两种不同的布局
```C
int privileges;

if (invalid_login())
    if (allow_guests())
        privileges = GUEST;
else
    privileges = ADMINISTRATOR;



int privileges;
 
if (invalid_login())
    if (allow_guests())
        privileges = GUEST;
    else
        privileges = ADMINISTRATOR;
```

Compliant Solution:

```C

int privileges;

if (invalid_login()) {
    if (allow_guests()) {
        privileges = GUEST;
    }
} else {
    privileges = ADMINISTRATOR;
}
```

Noncompliant Code Example:
```C
while (invalid_login());
```

Compliant Solution:
```C
while (invalid_login()) {}
```

最好都加上{},防止出错
