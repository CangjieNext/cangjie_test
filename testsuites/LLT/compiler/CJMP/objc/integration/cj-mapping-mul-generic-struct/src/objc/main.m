#import <Foundation/Foundation.h>
#import "GenericStructInt32Int64.h"
#import "GenericStructFloat64Int32.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        GenericStructInt32Int64 *numberContainer1 = [[GenericStructInt32Int64 alloc] init:10 :55];
        int32_t result1 = [numberContainer1 getValueT];
        printf("T-int32: %d\n", result1);

        int64_t result3 = [numberContainer1 getValueU];
        printf("U-int64: %lld\n", result3);

        GenericStructFloat64Int32 *numberContainer2 = [[GenericStructFloat64Int32 alloc] init:10.2 :1999];
        double result7 = [numberContainer2 getValueT];
        printf("T-double: %lf\n", result7);

        int32_t result9 = [numberContainer2 getValueU];
        printf("U-int32: %d\n", result9);

    }
    return 0;
}