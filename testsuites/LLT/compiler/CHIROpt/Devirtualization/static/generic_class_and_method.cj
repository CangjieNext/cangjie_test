// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: generic class A1<T> + generic static foo<U>; A1<Bool>.bar<Int64>() -> Apply.
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7default2A1IG_E3fooIG0_Hv$bl
// ASSERT: scan InvokeStatic(This&->@_CN7default1A3fooIG_Hv
// ASSERT: scan-not InvokeStatic(Class-_CN7default2A1IG_E<Bool>&->@_CN7default1A3fooIG_Hv

interface A {
    static func foo<U>(): Int64
    static func bar<U>(): Int64 {
        return foo<U>()
    }
}

class A1<T> <: A {
    public static func foo<U>(): Int64 {
        return 1
    }
}

main() {
    A1<Bool>.bar<Int64>() - 1
}
