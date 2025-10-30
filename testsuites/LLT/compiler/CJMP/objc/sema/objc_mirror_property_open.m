#include <stdint.h>
#include <stddef.h>
#import <Foundation/Foundation.h>

@interface Base: NSObject
    @property(readonly) int64_t a;
    @property(readonly) int64_t b;
@end

@implementation Base
- (int64_t)a {
    return 2;
}
- (int64_t)b {
    return 4;
}
@end

@interface Derived: Base
    @property(readonly) int64_t a;
    @property(readonly) int64_t b;
@end

@implementation Derived
- (int64_t)a {
    return 12;
}
- (int64_t)b {
    return 18;
}
@end
