#import <stdint.h>

@protocol I
@property(readwrite) int64_t p1;
@property(readonly) int64_t p2;
- (void)f1;
- (void)f2;
@end
