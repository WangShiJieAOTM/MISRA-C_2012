### INT12-C. Do not make assumptions about the type of a plain int bit-field when used in an expression

**在表达式中使用普通int位字段时，不要假设其类型**

Noncompliant Code Example:

```C
struct {
  int a: 8;
} bits = {255};
 
int main(void) {
  printf("bits.a = %d.\n", bits.a);
  return 0;
}
```

Compliant Solution:

```C
struct {
  unsigned int a: 8;
} bits = {255};
 
int main(void) {
  printf("bits.a = %d.\n", bits.a);
  return 0;
}
```

对于数值，只能显式使用有符号或无符号字符类型。被视为unsigned的普通int位字段，只要其字段宽度小于int，就会被提升为int，因为int可以保存原始类型的所有值。这种行为与作为无符号字符处理的普通字符相同。但是，如果一个普通的int位字段被视为unsigned，如果它的字段宽度与int相等，则会提升为unsigned
int。这种差异使得普通的int位字段比普通的char位字段更棘手。

可能会被提升,这时候很多问题就会变得无法预料


