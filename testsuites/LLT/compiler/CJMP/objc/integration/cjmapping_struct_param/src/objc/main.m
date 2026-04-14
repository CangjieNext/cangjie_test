#import <Foundation/Foundation.h>

#import "BaseEnum.h"
#import "BaseStruct.h"
#import "BaseClosedClass.h"
#import "BaseInterface.h"
#import "TestStruct.h"

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

        TestStruct *testStructObj = [[TestStruct alloc] init:enumObj :structObj :closedObj :interfaceObj];
        
        BaseEnum *propEnum = [testStructObj varEnum];
        printf("in oc, %lld\n", (long long)[propEnum getVal]);

        BaseStruct *propStruct = [testStructObj varStruct];
        printf("in oc, %lld\n", (long long)[propStruct getVal]);

        BaseClosedClass *propClosed = [testStructObj varClosedClass];
        printf("in oc, %lld\n", (long long)[propClosed getVal]);

        id<BaseInterface> propInterface = [testStructObj varInterface];
        printf("in oc, %lld\n", (long long)[propInterface getVal]);



        BaseEnum *retEnum = [testStructObj funcEnum:enumObj];
        printf("in oc, %lld\n", (long long)[retEnum getVal]);

        BaseStruct *retStruct = [testStructObj funcStruct:structObj];
        printf("in oc, %lld\n", (long long)[retStruct getVal]);

        BaseClosedClass *retClosed = [testStructObj funcClosedClass:closedObj];
        printf("in oc, %lld\n", (long long)[retClosed getVal]);

        id<BaseInterface> retInterface = [testStructObj funcInterface:interfaceObj];
        printf("in oc, %lld\n", (long long)[retInterface getVal]);

    }
    return 0;
}