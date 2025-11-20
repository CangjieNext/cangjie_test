#import "I.h"
#import <Foundation/Foundation.h>

@interface M1 : NSObject <I>

- (id)init:(int64_t)a;
@property(readwrite) int64_t p1;

@end
