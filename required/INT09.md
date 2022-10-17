### INT09-C. Ensure enumeration constants map to unique values

**确保枚举常量映射唯一的值**

Noncompliant Code Example:

```C
enum Color { red=4, orange, yellow, green, blue, indigo=6, violet };

const char* color_name(enum Color col) {
    switch (col) {
        case red: return "red";
        case orange: return "orange";
        case yellow: return "yellow";
        case green: return "green";
        case blue: return "blue";
        case indigo: return "indigo";   /* Error: duplicate label (yellow) */
        case violet: return "violet";   /* Error: duplicate label (green) */
    }
}
```

Compliant Solution:

1.

```C
enum Color { red, orange, yellow, green, blue, indigo, violet };
```

2.

```C
enum Color { red=4, orange, yellow, green, blue, indigo=6, violet };
```

3.

```C
enum Color {
  red=4,
  orange=5,
  yellow=6,
  green=7,
  blue=8,
  indigo=6,
  violet=7
};
```

这些是合理的
