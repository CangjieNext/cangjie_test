#import <Foundation/Foundation.h>

@interface PM :NSObject
- (id)init;
- (void)pmFoo;
@end

@protocol P <NSObject>
- (nonnull PM*)pFoo:(nonnull PM*)p0;
@end
