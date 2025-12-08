#import "M.h"

int global_func(M *p0, int p1, float p2) {
    printf("global_func, p1 = %d, p2 = %f\n", p1, p2);
    [p0 mFoo];
    return 123;
}