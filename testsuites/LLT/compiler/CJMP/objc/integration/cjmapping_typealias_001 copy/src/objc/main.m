#import <Foundation/Foundation.h>

#import "AliasTestClass.h"
#import "BaseClass.h"
#import "DerivedClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AliasTestClass *aliasObj = [[AliasTestClass alloc] init];
        
        if (aliasObj) {
            int64_t intRet = [aliasObj testIntAlias:50];
            printf("%lld\n", (long long)intRet);

            BOOL boolRetTrue = [aliasObj testBoolAlias:YES];
            BOOL boolRetFalse = [aliasObj testBoolAlias:NO];
            printf("%lld\n", (long long)boolRetTrue);
            printf("%lld\n", (long long)boolRetFalse);

            int64_t mixRetTrue = [aliasObj testMixedAlias:88 :YES];
            int64_t mixRetFalse = [aliasObj testMixedAlias:88 :NO];
            printf("%lld\n", (long long)mixRetTrue);
            printf("%lld\n", (long long)mixRetFalse);
        }

        BaseClass *baseObj = [[BaseClass alloc] init:500];
        if (baseObj) {
            int64_t baseRes = [baseObj compute];
           printf("%lld\n", (long long)baseRes);
        }

        DerivedClass *derivedObj = [[DerivedClass alloc] init:500];
        if (derivedObj) {
            int64_t derivedRes = [derivedObj compute];
            printf("%lld\n", (long long)derivedRes);

            if (aliasObj) {
                AliasTestClass *retObj = [derivedObj getMyAliasTestClass:aliasObj];
                if (retObj) { 
                    int64_t finalCheck = [retObj testIntAlias:20];
                    printf("%lld\n", (long long)finalCheck);
                }
            }

        }
    }
    return 0;
}