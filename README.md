# LearningASM

## Hack the box academy

- Using 'nasm'

```bash
#link with libc 
nasm -f elf64 functions.s && ld functions.o -o functions -lc --dynamic-link /lib64/ld-linux-x86-64.so.2
```
