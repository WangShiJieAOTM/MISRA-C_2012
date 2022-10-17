### MSC09-C. Character encoding: Use subset of ASCII for safety

**字符编码:为确保安全使用ASCII的子集**

Noncompliant Code Example (File Name 1):

```C
#include <fcntl.h>
#include <sys/stat.h>
 
int main(void) {
   char *file_name = "\xe5ngstr\xf6m";
   mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
 
   int fd = open(file_name, O_CREAT | O_EXCL | O_WRONLY, mode);
   if (fd == -1) {
      /* Handle error */
   }
}
```

在一些平台上,\xe5ngstr\xf6m文件名被显示为 ?ngstr?m
Compliant Solution:

```C
int func(int condition) {
    char *s = NULL;
    if (condition) {
        s = (char *)malloc(10);
        if (s == NULL) {
           /* Handle error */
        }
        /* Process s */
    }
    /* ... */
    if (s) {
        /* This code is now reachable */
    }
    return 0;
}
```

Noncompliant Code Example (File Name 2):

```C
char myFilename[1000];
const char elimNewLn[] = "\n";
 
fgets(myFilename, sizeof(myFilename)-1, stdin);
myFilename[sizeof(myFilename)-1] = '\0';
myFilename[strcspn(myFilename, elimNewLn)] = '\0';
```

没有对文件名进行检查以防止出现麻烦的字符。如果攻击者知道这些代码存在于用于创建或重命名文件的程序中，这些文件稍后将在脚本或某种自动化过程中使用，他或她就可以在输出文件名中选择特定的字符，以达到恶意目的，混淆后面的过程。

Compliant Solution:

```C
char myFilename[1000];
const char elimNewln[] = "\n";
const char badChars[] = "-\n\r ,;'\\<\"";
do {
  fgets(myFilename, sizeof(myFilename)-1, stdin);
  myFilename[sizeof(myFilename)-1] ='\0';
  myFilename[strcspn(myFilename, elimNewln)]='\0';
} while ( (strcspn(myFilename, badChars))
           < (strlen(myFilename)));
```            
