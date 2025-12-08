# Test Nested Language Injections

This file tests support for deeply nested language injections.

## Inline LaTeX in Markdown

Here is some inline math: $x = \frac{1}{2}$ and $y = x^2$.

We can also have display math:

$$
\int_0^1 x^2 dx = \frac{1}{3}
$$

## Inline code with nested content

This is regular markdown with `inline code` that should work.

## Code blocks

```python
import numpy as np
x = np.array([1, 2, 3])
print(x)
```

## Mixed inline and block

Here's inline math $\alpha + \beta$ within text, and then a code block:

```r
x <- c(1, 2, 3)
mean(x)
```

More inline LaTeX: $\sum_{i=1}^{n} i = \frac{n(n+1)}{2}$
