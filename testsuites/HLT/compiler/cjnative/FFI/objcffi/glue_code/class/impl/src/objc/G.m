#import "M.h"

// 0 args
int global_func() {
    printf("global_func\n");
    return 123;
}

// 1 args
int global_func0(int p0) {
    printf("global_func0\n");
    return p0;
}

int global_func1(M *p0) {
    printf("global_func1\n");
    [p0 mFoo];
    return 114;
}
