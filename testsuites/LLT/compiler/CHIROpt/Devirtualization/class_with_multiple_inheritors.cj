// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default1AE&->@_CN7default1A2f1Hl
// ASSERT: scan-not Apply(Class-_CN7default1AE&->@_CN7default1A2f1Hl
// ASSERT: scan Invoke(Class-_CN7default2A1E&->@_CN7default1A2f1Hl
// ASSERT: scan-not Apply(Class-_CN7default2A1E&->@_CN7default1A2f1Hl

open class A {
    public open func f1(a: Int64): Int64 {
        1
    }
}

open class A1 <: A {}

open class A2 <: A1 {
    public open override func f1(a: Int64): Int64 {
        0
    }
}

func Test(a: A): Int64 {
    a.f1(1)
}

func Test1(a1: A1): Int64 {
    a1.f1(1)
}

main() {
    Test(A2()) + Test1(A2()) - 0
}
