#import <Foundation/Foundation.h>

@interface PM :NSObject
- (id)init;
- (void)pmFoo;
@end

@protocol P <NSObject>
- (PM*)pFoo:(PM*)p0;
@property (nonatomic, readwrite) struct S* pp0;
@property (nonatomic, readwrite) PM* pp2;
@end
