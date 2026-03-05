#import "GenericInterfaceFloat64Impl.h"

@implementation GenericInterfaceFloat64Impl {
    double value;
}

- (double)argretGenericFunc:(double)t {
    [self setValue: t];
    return [self getValue];
}

- (double)getValue {
    return value;
}

- (void)setValue:(double)t {
    value = t;
}

- (int32_t)normalFunc:(int32_t)t {
    return t;
}
@end