# SB programming language
## Syntax
#### Expressions
There is [A full documentation on the expressions](./op.txt) but you probably want a Fast Introduction™ so here it is \
Left expressions - works kinda like in C; `*(&a+3)` \
Precendence Parenthesis™ - works kinda like in Math; `(2 + 2) * 2 == 8` \
Basic arithmetics - works kinda like in C; `2 + 2 * 2 == 6` \
Expressioned statement - works kinda like in Rust; `2 + {printf("Aboba\n"); 2 * 2;} == 6` \
Equality, Inequality, Assignment(expect for "+="ish operators), Boolean operators works kinda same as in C \
***
#### In-function Statements
Almost like in C but there's a few exceptions. \
###### If/While
No more parenthesis.
You can write something like
```c
if 2 == 2 {
    printf("2 really equals to 2\n");
}
```
Or even
```c
if 2 == 2 printf("2 really equals to 2\n");
```
The same for while
###### Variables
"SB" has no variable scoping mechanisms yet. \
So you have to declare them at the function definition time: See the "In-global statements" section for more details. \
***
#### In-global statements
###### Functions(Procedures actually)
Almost like in C \
But without type specification \
And you have to declare all local variables before the start of function(procedure).
```
main() i, x, y, z {
    x = 0;
    y = 1;
    i = 0;
    while i < 10 {
        if i == 1      printf("1st element - %d\n", x);
        else if i == 2 printf("2nd element - %d\n", x);
        else if i == 3 printf("3rd element - %d\n", x);
        else           printf("%dth element - %d\n", i, x);
        z = x + y;
        x = y;
        y = z;
        i = i + 1;
    }
}
```
If function(procedure) has no local variables, just put an "!" instead.
```
fact(x)!
  if x < 1 x;
  else x*fact(x-1);
```
Also, you actually don't have to put a "return" statement if expression is at the end of function/block.
***
###### Globals
```
global main // Now le symbol "main" avaliable for an external object (e.g. crt1 - A thing your program wouldn't start that easily without)
// No semicolon needed
main(argc, argv)!
  ...
```
***
###### Global variables
No, they aren't the same as globals but more like globals().
```
glblInt; // Semicolon is required here; as I said above, they aren't the same as globals.
glblArr[69]; // 69 computer words, not bytes.
ayota()! (glblInt = glblInt + 1) - 1;
```
Continiously speaking, all global variables are allocated on the [.bss section](https://it.wikipedia.org/wiki/.bss), hence automatical[ly](https://en.wikipedia.org/wiki/-ly) [zero](https://en.wikipedia.org/wiki/Combinatorial_game_theory#Numbers)-[initialized](https://dictionary.cambridge.org/dictionary/english/initialized) by [your OS](https://en.wikipedia.org/wiki/Operating_system)
***
###### Externals
```
extern printf // Now le symbol "printf" avaliable for our object (Only if you are linking with it)
// No semicolon needed
```
***
# IR
Currently IR is used only in the [Bootstrapping file](./bootstrap/sbc.ir) to minimize its size.
But in the future I'll add other platforms (e.g. MS Windows)
# Bootstrapping
```shell
$ cc -o sba sba.c
$ ./sba bootstrap/sbc.ir sbc
$ ./sb sbc.sb sbc
$ ./sb sbc.sb sbc
$ ./sb sbc.sb sbc
$ ./sb sbc.sb sbc
... Now you can recompile the compiler using the same compiler
```
