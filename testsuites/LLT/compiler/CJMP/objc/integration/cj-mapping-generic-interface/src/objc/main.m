#import <Foundation/Foundation.h>
#import "GenericInterfaceInt32Impl.h"
#import "GenericInterfaceFloat64Impl.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        id<GenericInterfaceInt32> v1 = [[GenericInterfaceInt32Impl alloc] init];
        [v1 setValue:111];
        printf("Int32: %d\n", [v1 getValue]);

        printf("Int32: %d\n", [v1 argretGenericFunc:222]);

        printf("Int32: %d\n", [v1 normalFunc:89]);

        id<GenericInterfaceFloat64> v2 = [[GenericInterfaceFloat64Impl alloc] init];
        [v2 setValue:0.11];
        printf("Float64: %lf\n", [v2 getValue]);

        printf("Float64: %lf\n", [v2 argretGenericFunc:22.22]);

        printf("Int32: %d\n", [v2 normalFunc:18]);
    }
    return 0;
}