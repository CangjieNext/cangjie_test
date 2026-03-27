// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A1.h"
#import "A2.h"
#import "Test.h"
#import "K.h"
#import "Base2.h"
#import <Foundation/Foundation.h>

/*
Mirror       Impl
  Base  ->    A1, A2, Test

Mirror       Mirror
  Base2 ->    K

Mirror       Protocol
  Base2 <:    BaseProto

Test:
- (void)base2IsProto:(Base2*)m;
- (void)baseIsProto:(Base*)m;
- (void)KIsProto:(Base2*)m;
- (void)baseIsBase:(Base*)m;
- (void)baseIsA1:(Base*)m;
- (void)baseIsA2:(Base*)m;
- (void)A1isBase:(Base*)m;
- (void)A2isBase:(Base*)m;
- (void)A1isA2:(Base*)m;
- (void)A1isA1:(Base*)m;
- (void)A2isA2:(Base*)m;
*/

int main(int argc, char** argv) {
    @autoreleasepool {
        A1*     a1      = [[A1      alloc]  init];
        A2*     a2      = [[A2      alloc]  init];
        K*      k       = [[K       alloc]  init];
        Base*   base    = [[Base    alloc]  init];
        Base2*  base2   = [[Base2   alloc]  init];
        Test*   test    = [[Test    alloc]  init];

        [test base2IsProto  :base2   ]; // true
        [test baseIsProto   :base    ]; // false
        [test KIsProto      :k       ]; // true

        [test baseIsBase:base];         // true
        [test baseIsA1  :base];         // false
        [test baseIsA2  :base];         // false

        [test A1isBase  :a1];           // true
        [test A2isBase  :a2];           // true
        [test A1isA2    :a1];           // false
        [test A1isA1    :a1];           // true
        [test A2isA2    :a2];           // true

        [test BisA1];                   // false
    }
    return 0;
}
