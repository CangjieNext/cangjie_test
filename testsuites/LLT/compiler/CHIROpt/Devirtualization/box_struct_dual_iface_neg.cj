// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: S <: I<Int64> & I<String>, but I<T> parameters stay Invoke.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHCNY_1IIlECNY_1IIRNat6StringEE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default1IIG_E<Int64>&->@_CN7default1IIG_E3fooHv
// ASSERT: scan Invoke(Class-_CN7default1IIG_E<Struct-_CNat6StringE>&->@_CN7default1IIG_E3fooHv
// ASSERT: scan-not Apply(Struct-_CN7default1SE->@_CN7default1S3fooHv

interface I<T> {
    func foo(): Int64
}

struct S <: I<Int64> & I<String> {
    public func foo(): Int64 {
        2
    }
}

func use(x: I<Int64>, y: I<String>): Int64 {
    x.foo() + y.foo()
}

main() {
    use(S(), S()) - 4
}
