#import <Foundation/Foundation.h>
#import "AInt64.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AInt64* a = [AInt64 E: 1];
        printf("in oc, %lld\n", [a f: 1]);
        printf("in oc, %lld\n", a.p);
    }
    return 0;
}