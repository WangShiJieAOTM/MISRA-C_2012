### DCL23-C. Guarantee that mutually visible identifiers are unique

**确保相互可见的标识符是唯一的**

该标准规定了以下最低要求:

内部标识符或宏名称中的63个有效的初始字符。(每个通用字符名或扩展源字符被视为单个字符。)

外部标识符中的31个有效初始字符。

Noncompliant Code Example(Source Character Set):

```C
extern int *global_symbol_definition_lookup_table_a;
extern int *global_symbol_definition_lookup_table_b;
```

前31个字符相同，后面的字符不同，但是这两个标识符是相互可见的，因此是不合规的.

Compliant Solution(Source Character Set):

```C
extern int *a_global_symbol_definition_lookup_table;
extern int *b_global_symbol_definition_lookup_table;
```

第一位就不相同,在31个字符内不相同，因此是合规的.

Noncompliant Code Example (Universal Character Names):

```C
extern int *\U00010401\U00010401\U00010401\U00010401;
extern int *\U00010401\U00010401\U00010401\U00010402;
```

Compliant Solution (Universal Character Names):

```C
extern int *\U00010401\U00010401\U00010401\U00010401;
extern int *\U00010402\U00010401\U00010401\U00010401;
```