// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../../pick_defination.py pkg1.cj
// EXEC: %compiler %cmp_opt %enableDevirtualization pkg1.cj %compile_lib_opt -o test0.%middle
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all test0.%middle %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN4pkg12I1E&->@_CN4pkg12I14foo1Hv
// ASSERT: scan-not Apply(Class-_CN4pkg12I1E&->@_CN4pkg12I14foo1Hv

internal import pkg1.*

class A <: I1 {
    public func foo1(): Int64 {
        0
    }
}

func foo2(i: I1): Int64 {
    i.foo1()
}

main() {
    foo2(A()) - 0
}
