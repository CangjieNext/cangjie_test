// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan in I1

open class A {}
class B <: A {}

interface I0 {
    func foo(): A { println("in I0"); A() }
}
class I1 <: I0 {
    public func foo(): B { println("in I1"); B() }
}

func k<T>(a: T) where T <: I0 {
    a.foo()
}

main() {
    k<I1>(I1())
    0
}