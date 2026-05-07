// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan A
// ASSERT: scan-not A1

interface I1 {}
class C <: I1 {}

interface A1 {
    func foo<U>(a: U) where U <: I1 { println("A1") }
    // func goo(a: I1) { println("A1") }
}

class A <: A1 {
    public override func foo<T>(a: T) where T <: I1 { println("A") }
    // public override func goo(a: I1) { println("A") }
}

func k<T>(a: T) where T <: A1 {
    a.foo(C())
    // a.goo(C())
}

main() {
    k<A>(A()) // 应该打印 A，而不是 A1
    // A().foo(C())
}