#import "M.h"

M * global_func(M *p0) {
    printf("global_func\n");
    [p0 mFoo];
    return p0;
}
