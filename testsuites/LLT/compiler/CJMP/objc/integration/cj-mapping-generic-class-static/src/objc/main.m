#import <Foundation/Foundation.h>
#import "GenericClassInt32.h"
#import "GenericClassFloat64.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        GenericClassInt32 *numberContainer1 = [[GenericClassInt32 alloc] init];
        int32_t result1 = [numberContainer1 instanceMemberFunction: 30];
        printf("int32: %d\n", result1);

        GenericClassFloat64 *numberContainer2 = [[GenericClassFloat64 alloc] init];
        double result3 = [numberContainer2 instanceMemberFunction: 20.2];
        printf("double: %lf\n", result3);
    }
    return 0;
}