### DCL22-C. Use volatile for data that cannot be cached

**对无法被缓存的数据使用volatile**

Noncompliant Code Example:

```C
#include <stddef.h>
#include <stdint.h>

extern void get_register_bank(int32_t **bank,size_t *num_registers);
extern void external_wait(void);

void func(void) {
    int32_t bank[3];
    size_t num_regs = 3;
    
    get_register_bank((int32_t **)&bank, &num_regs);
    if (num_regs < 3) {
    /* Handle error */
}
bank[0] = 1;
external_wait();
bank[0] = 0;
}
```

不使用valatile,编译器可能会将bank[0] = 0;优化掉

Compliant Solution:

```C
#include <stddef.h>
#include <stdint.h>

extern void get_register_bank(volatile int32_t **bank,size_t *num_registers);
extern void external_wait(void);

void func(void) {
    volatile int32_t bank[3];
    size_t num_regs = 3;
    
    get_register_bank((volatile int32_t **)&bank, &num_regs);
    if (num_regs < 3) {
    /* Handle error */
}

bank[0] = 1;
external_wait();
bank[0] = 0;
}
```

使用volatile,编译器不会将bank[0] = 0;确保编译器不优化对内存的访问。
