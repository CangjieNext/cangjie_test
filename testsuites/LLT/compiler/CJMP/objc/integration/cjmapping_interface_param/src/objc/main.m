#import <Foundation/Foundation.h>

#import "BaseEnum.h"
#import "BaseStruct.h"
#import "BaseClosedClass.h"
#import "BaseOpenClass.h"
#import "BaseInterface.h"
#import "TestInterface.h"


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

@interface MyTestInterfaceImpl : NSObject <TestInterface>
@end

@implementation MyTestInterfaceImpl

- (BaseEnum*)funcEnum:(BaseEnum*)e {
    return e;
}

- (BaseStruct*)funcStruct:(BaseStruct*)s {
    return s;
}

- (BaseClosedClass*)funcClosedClass:(BaseClosedClass*)c {
    return c;
}

- (BaseOpenClass*)funcOpenClass:(BaseOpenClass*)c {
    return c;
}

- (id<BaseInterface>)funcInterface:(id<BaseInterface>)i {
    return i;
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BaseEnum *enumObj = [BaseEnum BaseVal];
        
        BaseStruct *structObj = [[BaseStruct alloc] init:200];
        
        BaseClosedClass *closedObj = [[BaseClosedClass alloc] init];
        
        BaseOpenClass *openObj = [[BaseOpenClass alloc] init];
        
        MyBaseInterfaceImpl *interfaceObj = [[MyBaseInterfaceImpl alloc] init];

        MyTestInterfaceImpl *testImpl = [[MyTestInterfaceImpl alloc] init];
        
        BaseEnum *retEnum = [testImpl funcEnum:enumObj];
        printf("in oc, %lld\n", (long long)[retEnum getVal]);

        BaseStruct *retStruct = [testImpl funcStruct:structObj];
        printf("in oc, %lld\n", (long long)[retStruct getVal]);
        
        BaseClosedClass *retClosed = [testImpl funcClosedClass:closedObj];
        printf("in oc, %lld\n", (long long)[retClosed getVal]);

        BaseOpenClass *retOpen = [testImpl funcOpenClass:openObj];
        printf("in oc, %lld\n", (long long)[retOpen getVal]);

        id<BaseInterface> retInterface = [testImpl funcInterface:interfaceObj];
        printf("in oc, %lld\n", (long long)[retInterface getVal]);
    }
    return 0;
}