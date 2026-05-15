extern InitWindow
extern WindowShouldClose
extern BeginDrawing
extern EndDrawing
extern ClearBackground
extern GetMouseX
extern GetMouseY
extern DrawLine
extern printf

fib(x)!
    if x<=1 x;
    else fib(x-1)+fib(x-2);

global main
main() msx, msy {
    printf("%d\n", fib(8));
    InitWindow(640, 480, "Hello from SB");
    while !WindowShouldClose() {
        BeginDrawing();
        msx = GetMouseX();
        msy = GetMouseY();
        ClearBackground(0xFFFFFFFF);
        DrawLine(msx, msy, 320, 240, 0xFF0000FF);
        EndDrawing();
    }
}
