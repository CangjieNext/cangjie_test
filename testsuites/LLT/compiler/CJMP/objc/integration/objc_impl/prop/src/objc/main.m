// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        printf("objc: main\n");
        A* a = [[A alloc] init];

        // primitive
        
        NSCAssert1(a.primitive == 5, @"Expected a.primitive == 5, but got %d", a.primitive);

        NSCAssert1(a.primitiveMut == 0, @"Expected a.primitiveMut == 0, but got %d", a.primitive);
        a.primitiveMut = 6;
        NSCAssert1(a.primitiveMut == 6, @"Expected a.primitiveMut == 6, but got %d", a.primitiveMut);
        
        NSCAssert1(A.primitiveStatic == 6, @"Expected A.primitiveStatic == 6, but got %d", A.primitiveStatic);
        
        NSCAssert1(A.primitiveStaticMut == 6, @"Expected A.primitiveStaticMut == 6, but got %d", A.primitiveStaticMut);
        A.primitiveStaticMut = 7;
        NSCAssert1(A.primitiveStaticMut == 7, @"Expected A.primitiveStaticMut == 7, but got %d", A.primitiveStaticMut);

        // mirror

        NSCAssert1(a.mirror.value == 5, @"Expected a.mirror.value == 5, but got %d", a.mirror.value);

        NSCAssert1(a.mirrorMut.value == 5, @"Expected a.mirrorMut.value == 5, but got %d", a.mirrorMut.value);
        a.mirrorMut = [[M alloc] initWithValue:10];
        NSCAssert1(a.mirrorMut.value == 10, @"Expected a.mirrorMut.value == 10, but got %d", a.mirrorMut.value);
        
        NSCAssert1(A.mirrorStatic.value == 5, @"Expected A.mirrorStatic.value == 5, but got %d", A.mirrorStatic.value);
        
        NSCAssert1(A.mirrorStaticMut.value == 5, @"Expected A.mirrorStaticMut.value == 5, but got %d", A.mirrorStaticMut.value);
        A.mirrorStaticMut = [[M alloc] initWithValue:15];
        
        NSCAssert1(a.mirrorSelf.value == 5, @"Expected a.mirrorSelf.value == 5, but got %d", a.mirrorSelf.value);

        // impl

        NSCAssert1(a.implSelf.value == 5, @"Expected a.implSelf.value == 5, but got %d", a.implSelf.value);
        
        a.implMut = a;
        NSCAssert1(a.implMut.value == 5, @"Expected a.implMut.value == 5, but got %d", a.implMut.value);
        
        NSCAssert1(A.implStatic.value == 5, @"Expected a.implStatic.value == 5, but got %d", A.implStatic.value);
        
        A.implStaticMut = a;
        NSCAssert1(A.implStaticMut.value == 5, @"Expected A.implStaticMut.value == 5, but got %d", A.implStaticMut.value);

        printf("objc: main end\n");
    }
    return 0;
}
