#import <Foundation/Foundation.h>
#import "GenericClassInt32.h"
#import "GenericClassFloat64.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        GenericClassInt32 *numberContainer1 = [[GenericClassInt32 alloc] init:10];
        int32_t result1 = [numberContainer1 getValue];
        printf("int32: %d\n", result1);
        [numberContainer1 setValue:20];
        int32_t result2 = [numberContainer1 getValue];
        printf("int32: %d\n", result2);


        GenericClassFloat64 *numberContainer2 = [[GenericClassFloat64 alloc] init:10.2];
        double result3 = [numberContainer2 getValue];
        printf("double: %lf\n", result3);
        [numberContainer2 setValue:0.5];
        double result4 = [numberContainer2 getValue];
        printf("double: %lf\n", result4);
    }
    return 0;
}