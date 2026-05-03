# SB programming language
TBD: Syntax section
# Bootstrapping
```shell
$ nasm -fELF64 bootstrap/sbc.s sbc.o
$ cc -no-pie -o sbc sbc.o
$ ./sbc sbc.sb sbc
$ ./sbc sbc.sb sbc
$ ./sbc sbc.sb sbc
$ ./sbc sbc.sb sbc
... Now you can recompile the compiler using the same compiler
```
