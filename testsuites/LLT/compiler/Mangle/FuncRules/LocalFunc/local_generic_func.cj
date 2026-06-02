// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal void @_CN7default3fooHlE2idIG_HG_
// (CJNATIVE) ASSERT: scan define internal i64 @_CN7default3fooHlE6doubleHl
// (CJNATIVE) ASSERT: scan define void @_CN7defaultXCNY_3FooIG_E1gHv
// (CJNATIVE) ASSERT: scan define internal void @_CN7defaultXCNY_3FooIG_EU000000001DBEgK_1fIG0_Hv

// nested generic func
func foo(a: Int64) {
    func id<T>(a: T): T {
        a
    }

    func double(a: Int64): Int64 {
        a + a
    }

    return (id<Int64> ~> double)(a) == (double ~> id<Int64>)(a)
}

// extend generic func
class Foo<T> {}

extend<T> Foo<T> {
    private func f<T>() {}
    func g() {
        f<T>()
    }
}

main() {
    let a = Foo<Int64>()
    a.g()
    0
}
