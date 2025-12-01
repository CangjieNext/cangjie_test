#import "M.h"

// 0 args
int global_func() {
    return 123;
}

// 1 args
int global_func0(int p0) {
    return p0;
}

int global_func1(M *p0) {
    [p0 mFoo];
    return 114;
}
