#import <Foundation/Foundation.h>
#import "GenericClassInt32Int64.h"
#import "GenericClassFloat64Int32.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        GenericClassInt32Int64 *numberContainer1 = [[GenericClassInt32Int64 alloc] init:10 :55];
        int32_t result1 = [numberContainer1 getValueT];
        printf("T-int32: %d\n", result1);
        [numberContainer1 setValueT:20];
        int32_t result2 = [numberContainer1 getValueT];
        printf("T-int32: %d\n", result2);

        int64_t result3 = [numberContainer1 getValueU];
        printf("U-int64: %lld\n", result3);
        [numberContainer1 setValueU:20];
        int64_t result4 = [numberContainer1 getValueU];
        printf("U-int64: %lld\n", result4);

        int32_t result5 = [numberContainer1 setUGetValueT: 99999] ;
        printf("T-int32: %d\n", result5);

        int64_t result6 = [numberContainer1 setTGetValueU: 3100];
        printf("U-int64: %lld\n", result6);

        GenericClassFloat64Int32 *numberContainer2 = [[GenericClassFloat64Int32 alloc] init:10.2 :1999];
        double result7 = [numberContainer2 getValueT];
        printf("T-double: %lf\n", result7);
        [numberContainer2 setValueT:99.99];
        double result8 = [numberContainer2 getValueT];
        printf("T-double: %lf\n", result8);

        int32_t result9 = [numberContainer2 getValueU];
        printf("U-int32: %d\n", result9);
        [numberContainer2 setValueU:1010];
        int32_t result10 = [numberContainer2 getValueU];
        printf("U-int32: %d\n", result10);

        double result11 = [numberContainer2 setUGetValueT: 88888] ;
        printf("T-double: %lf\n", result11);

        int32_t result12 = [numberContainer2 setTGetValueU: 0.001];
        printf("U-int32: %d\n", result12);
    }
    return 0;
}