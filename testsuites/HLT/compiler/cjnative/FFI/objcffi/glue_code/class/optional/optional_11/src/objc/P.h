#import <Foundation/Foundation.h>

@interface PM :NSObject
- (id)init;
- (void)pmFoo;
@end

@protocol P <NSObject>
- (nullable PM*)pFoo:(nullable PM*)p0;
@end
