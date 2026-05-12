extern printf
extern fprintf
extern stderr
extern abort
extern realloc
extern malloc
extern memcpy
extern free

/*
   struct da {
       it *items;         // +0
       size_t count;      // +8
       size_t cap;        // +16
       size_t sizeof(it); // +24
   }                      // 32
*/

daCo(itsz) ptr {
    ptr = malloc(32);
    *ptr = malloc(itsz*256);
    *(ptr+8) = 0;
    *(ptr+16) = 256;
    *(ptr+24) = itsz;
    ptr;
}

daPush(da, it)! {
    if *(da+8) + 1 >= *(da+16) {
        *(da+16) = *(da+16)*2;
        *da = realloc(*da, *(da+16)**(da+24));
    }
    memcpy(*da+*(da+8)**(da+24), it, *(da+24));
    *(da+8) = *(da+8) + 1;
}

daGet(da, idx)!
    if idx >= *(da+8) {
        fprintf(stderr, "Tried to access too big index: %zu >= %zu\n", idx, *(da+8));
        abort();
    } else *da+idx**(da+24);

daDe(da)! {
    free(*da);
    free(da);
}

global main
main() da, it, num {
    da = daCo(8);
    it = 0;
    while it < 300 {
        num = num+it*4;
        printf("Writing: %d: %zu\n", it, num);
        daPush(da, &num);
        it = it + 1;
    }
    it = 0;
    while it < 300 {
        printf("Reading: %d: %zu\n", it, *daGet(da, it));
        it = it + 1;
    }
    daDe(da);
    0;
}
