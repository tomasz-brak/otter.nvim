# Testing Nested LaTeX Injection Support

This document tests and demonstrates the nested language injection capabilities of otter.nvim.

## Summary of Implementation

The recursive extraction in otter.nvim now supports arbitrarily deep language nesting:
- ✓ Recursively processes all child parsers (language trees)
- ✓ Handles markdown > markdown_inline nesting
- ✓ Handles markdown > python code blocks  
- ✓ Can handle markdown > markdown_inline > latex IF treesitter grammar supports it

## What Works

1. **Direct code block injections**: ✓
   ```python
   import numpy as np
   ```

2. **Nested markdown_inline**: ✓
   Text with *inline* **formatting**

3. **Display math (if LaTeX grammar has proper injection)**: ?
   $$
   \int_0^1 x^2 dx
   $$

## Current Status of LaTeX Support

Whether LaTeX works depends on the treesitter grammars:

### For LaTeX to work with LSP in otter.nvim:
1. The markdown_inline treesitter grammar needs to define LaTeX as an injection
2. The injection query needs to identify `$...$` and `$$...$$` as LaTeX regions
3. Then otter's recursive extraction will find and extract it

### Current Behavior:
- LaTeX content is captured as part of markdown_inline chunks
- It's not automatically separated into its own language injection
- This means LaTeX LSP won't automatically attach to inline math

### Workarounds:
1. Use the `tex` or `latex` language for display math in fenced code blocks:
   ````markdown
   ```latex
   \int_0^1 x^2 dx = \frac{1}{3}
   ```
   ````

2. Or wait for upstream treesitter grammar updates to support LaTeX injection in markdown_inline

## Testing

To test if LaTeX injection works in your environment:
1. Create a markdown file with inline math: `$x = 1$`
2. Activate otter with `require'otter'.activate({'latex', 'markdown_inline'})`
3. Check if LaTeX chunks are extracted separately

## References

- treesitter-markdown: https://github.com/tree-sitter-grammars/tree-sitter-markdown
- treesitter-latex: https://github.com/latex-lsp/tree-sitter-latex
