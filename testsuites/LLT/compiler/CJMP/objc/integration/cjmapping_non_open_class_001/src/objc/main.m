#import <Foundation/Foundation.h>
#import "Class_01.h"
#import "Class_03.h"
#import "Class_04.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Class_01 *obj1 = [[Class_01 alloc] init];

        Class_03 *obj3 = [[Class_03 alloc] init:100 :50];

        int64_t res3 = [obj3 compute];
        printf("in oc, %lld\n", (long long)res3);
        
        int64_t staticVal = [Class_04 static_public_func];
        printf("in oc, %lld\n", (long long)staticVal);

        Class_04 *obj4 = [[Class_04 alloc] init];
        int64_t pubVal = [obj4 public_func];
        printf("in oc, %lld\n", (long long)pubVal);

        Class_01 *retObj1 = [obj4 closed_class_func:obj1];
        int64_t retVal1 = [retObj1 getval];
        printf("in oc, %lld\n", (long long)retVal1);

    }
    return 0;
}