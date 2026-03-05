#import "BB.h"

@implementation BB

- (id)init {
    if (self = [super init]) {
        printf("ObjC: BB.init()\n");
    }
    return self;
}

- (void)hello {
    [super hello];
    printf("ObjC: BB.hello()\n");
}

@end