#import <Foundation/Foundation.h>
#import <stddef.h>
#import "A.h"

@interface AA : A

- (id)init;
- (id)init :(int64_t)x;

- (int64_t)foo:(int64_t)x;
- (void)hello;
+ (int64_t)sfoo:(int64_t)x;
@end
