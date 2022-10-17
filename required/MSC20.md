### MSC20-C. Do not use a switch statement to transfer control into a complex block

**别使用switch表达式将控制转移到复杂的代码块中**

Noncompliant Code Example:

```C
int f(int i) {
  int j=0;
  switch (i) {
    case 1:
      for(j=0;j<10;j++) {
      /* No break; process case 2 as well */
    case 2: /* switch jumps inside the for block */
        j++;
      /* No break; process case 3 as well */
    case 3:
        j++;
      }
      break;
  default:
    /* Default action */
    break;
  }
  return j;
}
```

Compliant Solution:

```C
int f(int i) {
  int j=0;
  switch (i) {
    case 1:
      /* No break; process case 2 as well */
    case 2:
      j++;
      /* No break; process case 3 as well */
    case 3:
      j++;
      break;
    default:
      /* Default action */
      return j;
  }
  for(j++;j<10;j++) {
    j+=2;
  }
  return j;
}
```

Noncompliant Code Example:

```C
int n = (count + 7) / 8;
switch (count % 8) {
  case 0: do { *to = *from++;
  case 7:      *to = *from++;
  case 6:      *to = *from++;
  case 5:      *to = *from++;
  case 4:      *to = *from++;
  case 3:      *to = *from++;
  case 2:      *to = *from++;
  case 1:      *to = *from++;
          } while (--n > 0);
}
```

Compliant Solution:

```C
int n = (count + 7) / 8;
switch (count % 8) {
  case 0: *to = *from++; /* Fall through */
  case 7: *to = *from++; /* Fall through */
  case 6: *to = *from++; /* Fall through */
  case 5: *to = *from++; /* Fall through */
  case 4: *to = *from++; /* Fall through */
  case 3: *to = *from++; /* Fall through */
  case 2: *to = *from++; /* Fall through */
  case 1: *to = *from++; /* Fall through */
}
while (--n > 0) {
  *to = *from++;
  *to = *from++;
  *to = *from++;
  *to = *from++;
  *to = *from++;
  *to = *from++;
  *to = *from++;
  *to = *from++;
}
```

这一节的例子就离谱