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

M * global_func1(M *p0) {
    printf("global_func1\n");
    [p0 mFoo];
    return p0;
}

// multi params.
int global_func2(M *p0, int p1, float p2) {
    printf("global_func2, p1 = %d, p2 = %f\n", p1, p2);
    [p0 mFoo];
    return 114;
}

// named params.
int global_func3(M *p0, int p1, float p2) {
    printf("global_func3, p1 = %d, p2 = %f\n", p1, p2);
    [p0 mFoo];
    return 114;
}

// named params with default values.
int global_func4(M *p0, int p1, float p2) {
    printf("global_func4, p1 = %d, p2 = %f\n", p1, p2);
    [p0 mFoo];
    return 114;
}

// named params with default values.
id<P> global_func5(id<P> p0) {
    printf("global_func5\n");
    [p0 pFoo];
    return p0;
}
