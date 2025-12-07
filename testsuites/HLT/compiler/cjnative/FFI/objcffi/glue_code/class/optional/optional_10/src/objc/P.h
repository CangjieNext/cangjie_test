#import <Foundation/Foundation.h>

@interface PM :NSObject
- (id)init;
- (void)pmFoo;
@end

@protocol P <NSObject>
- (PM*)pFoo:(PM*)p0;
@end
