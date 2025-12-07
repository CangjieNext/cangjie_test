#import "M.h"

id<P> global_func(id<P> p0) {
    printf("global_func\n");
    [p0 pFoo];
    return p0;
}
