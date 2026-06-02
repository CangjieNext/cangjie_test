#import "AA.h"

@implementation AA

- (id)init {
    if (self = [super init]) {
        printf("ObjC: AA.init()\n");
    }
    return self;
}

- (id)init :(int64_t)x {
    if (self = [super init:x]) {
        printf("ObjC: AA.init(%lld)\n", x);
    }
    return self;
}

- (int64_t)foo :(int64_t)x {
    printf("ObjC: AA.foo(%lld)\n", x);
    return [super foo :x];
}

- (void)hello {
    [super hello];
    printf("ObjC: AA.hello()\n");
}

+ (int64_t)sfoo :(int64_t)x {
    printf("ObjC: AA.sfoo(%lld)\n", x);
    return [A sfoo :x];
}

@end