#import <Foundation/Foundation.h>
#import "AInt64.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AInt64* a = [[AInt64 alloc] init: 1];
        printf("in oc f, %lld\n", [a f: 1]);
        printf("in oc p, %lld\n", a.p);
        printf("in oc v, %lld\n", a.v);
    }
    return 0;
}
