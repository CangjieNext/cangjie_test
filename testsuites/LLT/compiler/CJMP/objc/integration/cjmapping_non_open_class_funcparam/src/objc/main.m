#import <Foundation/Foundation.h>

#import "BaseEnum.h"
#import "BaseStruct.h"
#import "BaseClosedClass.h"
#import "BaseInterface.h"
#import "TestClosedClass.h"

@interface MyBaseInterfaceImpl : NSObject <BaseInterface>
@end

@implementation MyBaseInterfaceImpl
- (void)doNothing {
}
- (int64_t)getVal {
    return 500;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BaseEnum *enumObj = [BaseEnum BaseVal];
        BaseStruct *structObj = [[BaseStruct alloc] init:200];
        BaseClosedClass *closedObj = [[BaseClosedClass alloc] init];
        MyBaseInterfaceImpl *interfaceObj = [[MyBaseInterfaceImpl alloc] init];

        TestClosedClass *testClosedObj = [[TestClosedClass alloc] init];
        
        BaseEnum *retEnum = [testClosedObj funcEnum:enumObj];
        printf("in oc, %lld\n", (long long)[retEnum getVal]);

        BaseStruct *retStruct = [testClosedObj funcStruct:structObj];
        printf("in oc, %lld\n", (long long)[retStruct getVal]);

        BaseClosedClass *retClosed = [testClosedObj funcClosedClass:closedObj];
        printf("in oc, %lld\n", (long long)[retClosed getVal]);

        id<BaseInterface> retInterface = [testClosedObj funcInterface:interfaceObj];
        printf("in oc, %lld\n", (long long)[retInterface getVal]);
    }
    return 0;
}