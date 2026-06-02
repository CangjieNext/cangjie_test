#import "AImp.h"
@implementation AImp
- (void)foo {
    printf("Hello in ObjC!\n");
}
- (void)goo:(int32_t)a :(int32_t)b {
    printf("%d\n", a + b);
}
- (int32_t)koo {
    return 666;
}
- (int32_t)hoo:(int32_t)a {
    return a * 2;
}
@end