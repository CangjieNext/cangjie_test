// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (arm and CJNATIVEGC) ASSERT: scan define i64 @"pkg:foo1"(i64
// (x86 and CJNATIVEGC) ASSERT: scan define i8 @"pkg:foo1"(i8
// (not CJNATIVE) ASSERT: scan define %record._ZN3pkg1AE @"pkg:foo1"(%record._ZN3pkg1AE
// ASSERT: scan define i8 @"pkg:foo2"(i8
package pkg

foreign func foo1(n: A): A

@C
private func foo2(n: Int8): Int8 {
    println("foo2: n = ${n}")
    n
}

public func foo<T>(n: Int8) {
    unsafe {
        foo2(n)
        var a = A()
        foo1(a)
    }
    0
}

@C
struct A {
    var a: Int8 = 0
}
