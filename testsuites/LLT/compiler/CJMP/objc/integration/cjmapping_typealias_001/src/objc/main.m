#import <Foundation/Foundation.h>

// 引入生成的头文件
#import "AliasTestClass.h"
#import "BaseClass.h"
#import "DerivedClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\n🚀 开始测试类型别名 (Type Alias) 的跨语言映射...\n");

        // ====================================================================
        // 测试 1: AliasTestClass (基础类型别名测试)
        // ====================================================================
        NSLog(@"--- [测试 1] AliasTestClass ---");
        AliasTestClass *aliasObj = [[AliasTestClass alloc] init];
        
        if (aliasObj) {
            // 测试 MyInt64 别名
            int64_t intRet = [aliasObj testIntAlias:50];
            NSLog(@"✅ testIntAlias(50)         返回: %lld (期待: 150)", (long long)intRet);

            // 测试 MyBool 别名
            BOOL boolRetTrue = [aliasObj testBoolAlias:YES];
            BOOL boolRetFalse = [aliasObj testBoolAlias:NO];
            NSLog(@"✅ testBoolAlias(YES)       返回: %d (期待: 0)", boolRetTrue);
            NSLog(@"✅ testBoolAlias(NO)        返回: %d (期待: 1)", boolRetFalse);

            // 测试混合别名
            int64_t mixRetTrue = [aliasObj testMixedAlias:88 :YES];
            int64_t mixRetFalse = [aliasObj testMixedAlias:88 :NO];
            NSLog(@"✅ testMixedAlias(88, YES)  返回: %lld (期待: 88)", (long long)mixRetTrue);
            NSLog(@"✅ testMixedAlias(88, NO)   返回: %lld (期待: 0)", (long long)mixRetFalse);
            
        } else {
            NSLog(@"❌ AliasTestClass 实例化失败！");
        }

        // ====================================================================
        // 测试 2: BaseClass (别名的本体类)
        // ====================================================================
        NSLog(@"\n--- [测试 2] BaseClass (本体类) ---");
        BaseClass *baseObj = [[BaseClass alloc] init:500];
        if (baseObj) {
            int64_t baseRes = [baseObj compute];
            NSLog(@"✅ BaseClass compute 返回: %lld (期待: 500)", (long long)baseRes);
        } else {
            NSLog(@"❌ BaseClass 实例化失败！");
        }

        // ====================================================================
        // 测试 3: DerivedClass (继承别名，以及类对象别名传参)
        // ====================================================================
        NSLog(@"\n--- [测试 3] DerivedClass (继承别名测试) ---");
        DerivedClass *derivedObj = [[DerivedClass alloc] init:500];
        if (derivedObj) {
            // 测试继承重写逻辑
            int64_t derivedRes = [derivedObj compute];
            NSLog(@"✅ DerivedClass compute 返回: %lld (期待: 1500)", (long long)derivedRes);

            // ----------------------------------------------------------------
            // 新增测试：测试自定义类名别名作为入参和出参
            // ----------------------------------------------------------------
            NSLog(@"\n--- [新增] 测试类对象别名传参 (MyAliasTestClass) ---");
            if (aliasObj) {
                // 将上面实例化的 AliasTestClass 对象传入
                AliasTestClass *retObj = [derivedObj getMyAliasTestClass:aliasObj];
                
                if (retObj) {
                    NSLog(@"✅ getMyAliasTestClass 对象透传成功！");
                    
                    // 验证指针是否相同（说明没有发生错误的拷贝或断链）
                    if (retObj == aliasObj) {
                        NSLog(@"   -> 内存地址验证通过：传入与返回的是同一个对象指针。");
                    }
                    
                    // 二次验证返回的对象是否保留了完整的方法区映射
                    int64_t finalCheck = [retObj testIntAlias:20];
                    NSLog(@"   -> 内部逻辑验证：对返回对象执行 testIntAlias(20) = %lld (期待: 120)", (long long)finalCheck);
                } else {
                    NSLog(@"❌ getMyAliasTestClass 返回了 nil，透传失败！");
                }
            } else {
                 NSLog(@"⚠️ 无法测试透传，因为前置依赖 aliasObj 为空。");
            }

        } else {
            NSLog(@"❌ DerivedClass 实例化失败！");
        }

        NSLog(@"\n🎉 别名进阶映射测试完毕！\n");
    }
    return 0;
}