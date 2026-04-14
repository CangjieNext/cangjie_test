#import <Foundation/Foundation.h>
#import "Enum_01.h"
#import "Enum_02.h"
#import "Enum_03.h"
#import "Enum_04.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Enum_01 *circle = [Enum_01 Circle:3.14159];
        Enum_01 *rectangle = [Enum_01 Rectangle:10.0 :20.5]; 
        
        if (circle && rectangle) {
            printf("Enum_01 pass\n");
        }
        Enum_02 *valEnum = [Enum_02 Value:42];
        Enum_02 *emptyEnum = [Enum_02 Empty];
        
        int64_t valResult = [valEnum getValueOrDefault];
        int64_t emptyResult = [emptyEnum getValueOrDefault];
        printf("%lld\n", (long long)valResult);
        printf("%lld\n", (long long)emptyResult);

        Enum_03 *num1 = [Enum_03 Num:100];
        Enum_03 *num2 = [Enum_03 Num:50];
        Enum_03 *addExpr = [Enum_03 Add:num1 :num2];
        Enum_03 *subExpr = [Enum_03 Sub:addExpr :num1];
        
        if (addExpr && subExpr) {
            printf("Enum_03 pass\n");
        }


        Enum_04 *li1 = [Enum_04 Li:1];
        Enum_04 *li2 = [Enum_04 Li:1 :2];
        Enum_04 *li3 = [Enum_04 Li:1 :2 :3];
        if (li1 && li2 && li3) {
            printf("Enum_04 pass\n");
        }

    }
    return 0;
}