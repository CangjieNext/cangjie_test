// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: same struct S <: I<Int64> & I<Bool> with distinct overloads; each boxed
// call de-virts to the matching S::id.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Struct-_CN7default1SE->@_CN7default1S2idHl
// ASSERT: scan Apply(Struct-_CN7default1SE->@_CN7default1S2idHb
// ASSERT: scan-not Invoke(Class-_CN7default1IIG_E<Int64>&->@_CN7default1IIG_E2idHG_
// ASSERT: scan-not Invoke(Class-_CN7default1IIG_E<Bool>&->@_CN7default1IIG_E2idHG_

interface I<T> {
    func id(x: T): Int64
}

struct S <: I<Int64> & I<Bool> {
    public func id(x: Int64): Int64 {
        1
    }
    public func id(x: Bool): Int64 {
        2
    }
}

func use(): Int64 {
    var a: I<Int64> = S()
    var b: I<Bool> = S()
    a.id(0) + b.id(true)
}

main() {
    use() - 3
}
