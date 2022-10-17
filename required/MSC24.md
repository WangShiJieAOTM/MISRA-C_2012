### MSC24-C. Do not use deprecated or obsolescent functions

**别使用废弃或过时的功能**

Noncompliant Code Example:

```C
#include <string.h>
#include <stdio.h>
  
enum { BUFSIZE = 32 };
void complain(const char *msg) {
 
  static const char prefix[] = "Error: ";
  static const char suffix[] = "\n";
  char buf[BUFSIZE];
 
  strcpy(buf, prefix);
  strcat(buf, msg);
  strcat(buf, suffix);
  fputs(buf, stderr);
}
```

Compliant Solution:

```C
#define __STDC_WANT_LIB_EXT1__
#include <string.h>
#include <stdio.h>
  
enum { BUFFERSIZE = 256 };
 
void complain(const char *msg) {
  static const char prefix[] = "Error: ";
  static const char suffix[] = "\n";
  char buf[BUFFERSIZE];
 
  strcpy_s(buf, BUFFERSIZE, prefix);
  strcat_s(buf, BUFFERSIZE, msg);
  strcat_s(buf, BUFFERSIZE, suffix);
  fputs(buf, stderr);
}
```

Deprecated Functions:

gets()函数被废弃,因为他不检查缓冲区的大小,容易造成缓冲区溢出,使用gets_s()函数代替

Obsolescent Functions:

| Obsolescent Functions | Recommended Alternative |          Rationale          |
|:---------------------:|:-----------------------:|:---------------------------:|
|       asctime()       |       asctime_s()       |        Non-reentrant        |
|        atof()         |        strtod()         |     No error detection      |
|        atoi()         |        strtol()         |     No error detection      |
|        atol()         |        strtol()         |     No error detection      |
|        atoll()        |        strtoll()        |     No error detection      |
|        ctime()        |        ctime_s()        |        Non-reentrant        |        
|        fopen()        |        fopen_s()        | No exclusive access to file |
|       freopen()       |       freopen_s()       | No exclusive access to file | 
|       rewind()        |         fseek()         |     No error detection      |      
|       setbuf()        |        setvbuf()        |     No error detection      |   
|       setbuf()        |        setvbuf()        |     No error detection      |
|       rewind()        |         fseek()         |     No error detection      |
|       freopen()       |       freopen_s()       | No exclusive access to file |
|        fopen()        |        fopen_s()        | No exclusive access to file |
|        ctime()        |        ctime_s()        |        Non-reentrant        |
|        atoll()        |        strtoll()        |     No error detection      |
|        atol()         |        strtol()         |     No error detection      |
|        atoi()         |        strtol()         |     No error detection      |
|        atof()         |        strtod()         |     No error detection      |
|       asctime()       |       asctime_s()       |        Non-reentrant        |

Unchecked Obsolescent Functions:

| Obsolescent Functions | Recommended Alternative |
|:---------------------:|:-----------------------:|
|   bsearch()	          |      bsearch_s()        |
|      fprintf()	       |       fprintf_s()       | 
|       fscanf()	       |       fscanf_s()        |
|      fwprintf()	      |      fwprintf_s()       |
|      fwscanf()	       |       fwscanf_s()       |
|       getenv()	       |       getenv_s()        |
|       gmtime()	       |       gmtime_s()        |
|      localtime()      |     	localtime_s()      |
|      mbsrtowcs()      |     	mbsrtowcs_s()      |
|      mbstowcs()	      |      mbstowcs_s()       |
|       memcpy()	       |       memcpy_s()        |
|      memmove()	       |       memmove_s()       |
|       printf()	       |       printf_s()        |
|       qsort()	        |        qsort_s()        |
|       scanf()	        |        scanf_s()        |
|      snprintf()	      |      snprintf_s()       |
|      sprintf()	       |       sprintf_s()       |
|       sscanf()	       |       sscanf_s()        |
|       strcat()	       |       strcat_s()        |
|       strcpy()	       |       strcpy_s()        |
|      strerror()	      |      strerror_s()       |
|       strlen()	       |       strnlen_s()       |
|      strncat()	       |       strncat_s()       |
|      strncpy()	       |       strncpy_s()       |
|       strtok()	       |       strtok_s()        |
|      swprintf()	      |      swprintf_s()       |
|      swscanf()	       |       swscanf_s()       |
|      vfprintf()	      |      vfprintf_s()       |
|      vfscanf()	       |       vfscanf_s()       |
|      vfwprintf()      |     	vfwprintf_s()      |
|      vfwscanf()	      |      vfwscanf_s()       |
|      vprintf()	       |       vprintf_s()       |
|       vscanf()	       |       vscanf_s()        |
|      vsnprintf()      |     	vsnprintf_s()      |
|      vsprintf()	      |      vsprintf_s()       |
|      vsscanf()	       |       vsscanf_s()       |
|      vswprintf()      |     	vswprintf_s()      |
|      vswscanf()	      |      vswscanf_s()       |
|      vwprintf()	      |      vwprintf_s()       |
|      vwscanf()	       |       vwscanf_s()       |
|      wcrtomb()	       |       wcrtomb_s()       |
|       wcscat()	       |       wcscat_s()        |
|       wcscpy()	       |       wcscpy_s()        |
|       wcslen()	       |       wcsnlen_s()       |
|      wcsncat()	       |       wcsncat_s()       |
|      wcsncpy()	       |       wcsncpy_s()       |
|      wcsrtombs()      |     	wcsrtombs_s()      |
|       wcstok()	       |       wcstok_s()        |
|      wcstombs()	      |      wcstombs_s()       |
|       wctomb()	       |       wctomb_s()        |
|      wmemcpy()	       |       wmemcpy_s()       |
|      wmemmove()	      |      wmemmove_s()       |
|      wprintf()	       |       wprintf_s()       |
|       wscanf()	       |       wscanf_s()        |     