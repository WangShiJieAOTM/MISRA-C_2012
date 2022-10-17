### STR04-C. Use plain char for characters in the basic character set

**在基本字符集中使用普通的字符**

Noncompliant Code Example:

```C
size_t len;
char cstr[] = "char string";
signed char scstr[] = "signed char string";
unsigned char ucstr[] = "unsigned char string";
 
len = strlen(cstr);
len = strlen(scstr);  /* Warns when char is unsigned */
len = strlen(ucstr);  /* Warns when char is signed */
```

Compliant Solution:

```C
size_t len;
char cstr[] = "char string";
 
len = strlen(cstr);
```
