#import <Foundation/Foundation.h>
#import "Class_01.h"
#import "Class_02.h"
#import "Class_03.h"
#import "Class_04.h"

@interface ObjC_Class_04 : Class_03
@end

@implementation ObjC_Class_04

- (int64_t)compute {
    int64_t superValue = [super compute];
    return superValue + 1000;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Class_01 *obj1 = [[Class_01 alloc] init];
        if (obj1) {
            int64_t x1 = [obj1 getval_x];
            int64_t tag1 = [obj1 getval_tag];
            int64_t y1 = [obj1 getval_y];
            printf("%lld\n", (long long)x1);
            printf("%lld\n", (long long)tag1);
            printf("%lld\n", (long long)y1);
        }

        Class_01 *obj2 = [[Class_01 alloc] init:10];
        if (obj2) {
            int64_t x2 = [obj2 getval_x];
            int64_t tag2 = [obj2 getval_tag];
            int64_t y2 = [obj2 getval_y];
            printf("%lld\n", (long long)x2);
            printf("%lld\n", (long long)tag2);
            printf("%lld\n", (long long)y2);
        }

        Class_01 *obj3 = [[Class_01 alloc] init:100 :200 :300];
        if (obj3) {
            int64_t x3 = [obj3 getval_x];
            int64_t tag3 = [obj3 getval_tag];
            int64_t y3 = [obj3 getval_y];
            printf("%lld\n", (long long)x3);
            printf("%lld\n", (long long)tag3);
            printf("%lld\n", (long long)y3);
        }

        Class_03 *subObj = [[Class_03 alloc] init:50 :30];
        if (subObj) {
            int64_t res3 = [subObj compute];
            printf("%lld\n", (long long)res3);
        }

        ObjC_Class_04 *objcSubObj = [[ObjC_Class_04 alloc] init:50 :30];
        if (objcSubObj) {
            int64_t res4 = [objcSubObj compute];
            printf("%lld\n", (long long)res4);
        }

        Class_04 *obj4 = [[Class_04 alloc] init];
        if (obj4) {
            int64_t res_public = [obj4 public_func];
            printf("%lld\n", (long long)res_public);

            int64_t res_open_public = [obj4 open_public_func];
            printf("%lld\n", (long long)res_open_public);
            
            int64_t res_open_protected = [obj4 open_protected_func];
            printf("%lld\n", (long long)res_open_protected);
          
            int64_t res_static_public = [Class_04 static_public_func];
            printf("%lld\n", (long long)res_static_public);
        }

    }
    return 0;
}