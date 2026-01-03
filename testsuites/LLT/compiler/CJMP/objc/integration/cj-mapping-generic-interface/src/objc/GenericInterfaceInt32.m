#import "GenericInterfaceInt32Impl.h"

@implementation GenericInterfaceInt32Impl {
    int32_t value;
}

- (int32_t)argretGenericFunc:(int32_t)t {
    [self setValue:t];
    return [self getValue];
}

- (int32_t)getValue {
    return value;
}

- (void)setValue:(int32_t)t {
    value = t;
}

- (int32_t)normalFunc:(int32_t)t {
    return t;
}
@end