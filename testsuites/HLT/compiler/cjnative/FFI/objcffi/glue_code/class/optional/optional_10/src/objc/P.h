#import <Foundation/Foundation.h>

@interface PM :NSObject
- (id)init;
- (void)pmFoo;
@end

@protocol P <NSObject>
- (PM*)pFoo:(PM*)p0;
@property (nonatomic, readwrite) struct S* pp0;
@property (nonatomic, readwrite) NSObject<P> * pp1;
@property (nonatomic, readwrite) M* pp2;
@property (nonatomic, readwrite) id<P> pp3;
@end
