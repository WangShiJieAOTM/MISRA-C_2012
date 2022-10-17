### INT02-C. Understand integer conversion rules

**理解整数转换原则**

整数提升:
对于小于int的整数类型执行算术运算时,如果该原始类型的所有值都可以用int类型来表示,那么该小类型将会转换为int的类型,否则将转换为unsigned
int 类型

下面的这个例子展示了整型提升的一个例子:

```C
char c1, c2;
c1 = c1 + c2;
```

整数提升的一个优点是防止了中间变量的溢出:

```C
signed char cresult, c1, c2, c3;
c1 = 100;
c2 = 3;
c3 = 4;
cresult = c1 * c2 / c3;
```

↑上面的 c1 * c2 的结果是300,但是300是一个int类型,所以c1 * c2的结果会被提升为int类型,然后再除以c3,所以cresult的值是75

整数提升的缺点:

位运算符一般是作用在整型类型上的,当在比整型类型小的类型上使用位运算符时,会发生整数提升,这样就会导致一些问题:

```C
uint8_t port = 0x5a;
uint8_t result_8 = ( ~port ) >> 4;
```

这个例子中，代码的本意是先对port取反，然后向右移动四位。如果这两个操作符都作用在8字节的unsigned
integer上时，最终的结果将会是0x0a.

但是，操作过程中，port首先会升级为signed int类型，然后可能会产生下面图表中的结果

| 表达式 | 类型 | 值 |       备注        |
|:---:|:---:|:---:|:---------------:|
|port|uint8_t|0x5a|                 |
|~port|int|0xffffffa5|                 |
|~port >> 4|int|0x0ffffffa|   值是否为负由实现定义    |
|result_8|uint8_t|0xfa| 截取8字节作为unsigned |

正确的做法:

```C
uint8_t port = 0x5a;
uint8_t result_8 = (uint8_t) (~port) >> 4;
```

