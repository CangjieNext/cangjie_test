#import <Foundation/Foundation.h>
#import "GenericEnumInt32.h"
#import "GenericEnumFloat64.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        [[GenericEnumInt32 Red:10] printValue];
        [[GenericEnumInt32 Green:20] printValue];
        [[GenericEnumInt32 Blue:30] printValue];
        [[GenericEnumInt32 Red:50] setValue:3];
        [[GenericEnumInt32 Green:1] setValue:1000];
        [[GenericEnumInt32 Blue:2] setValue:999];
        printf("Int32: %d\n", [[GenericEnumInt32 Red:30] value]);

        [[GenericEnumFloat64 Red:0.88] printValue];
        [[GenericEnumFloat64 Green:1.89] printValue];
        [[GenericEnumFloat64 Blue:1000.01] printValue];
        [[GenericEnumFloat64 Red:99.99] setValue:30.88];
        [[GenericEnumFloat64 Green:0.1111] setValue:123.00];
        [[GenericEnumFloat64 Blue:11.1] setValue:99.9999];
        printf("Float64: %lf\n", [[GenericEnumFloat64 Red:9.882] value]);
    }
    return 0;
}