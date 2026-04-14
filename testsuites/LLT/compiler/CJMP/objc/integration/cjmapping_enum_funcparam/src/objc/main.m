#import <Foundation/Foundation.h>

#import "BaseEnum.h"
#import "BaseStruct.h"
#import "BaseClosedClass.h"
#import "BaseInterface.h"
#import "TestEnum.h"

@interface MyBaseInterfaceImpl : NSObject <BaseInterface>
@end

@implementation MyBaseInterfaceImpl
- (void)doNothing {
    NSLog(@"doNothing");
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

        TestEnum *testEnumInstance = [TestEnum Num:123];

        BaseEnum *retEnum = [testEnumInstance funcEnum:enumObj];
        printf("in oc, %lld\n", (long long)[retEnum getVal]);

        BaseStruct *retStruct = [testEnumInstance funcStruct:structObj];
        printf("in oc, %lld\n", (long long)[retStruct getVal]);

        BaseClosedClass *retClosed = [testEnumInstance funcClosedClass:closedObj];
        printf("in oc, %lld\n", (long long)[retClosed getVal]);

        id<BaseInterface> retInterface = [testEnumInstance funcInterface:interfaceObj];
        printf("in oc, %lld\n", (long long)[retInterface getVal]);

        if ([testEnumInstance respondsToSelector:@selector(funcFuncparams::)]) {
            int64_t retParams = [testEnumInstance funcFuncparams:YES :99];
            printf("in oc, %lld\n", (long long)retParams);
        }
    }
    return 0;
}