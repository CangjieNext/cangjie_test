// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: executable + same-package public open type is closed-world
// (IsSubtypeSetComplete). Unique override → FindRealCallee rewrites to Apply.
// Contrast: same source as staticlib keeps Invoke (see lib_visibility/static_open).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --fno-chir-function-inlining %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default4callHCNY_8OpenBaseE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default8OnlyImplE&->@_CN7default8OnlyImpl3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default8OpenBaseE&->@_CN7default8OpenBase3fooHv

public abstract class OpenBase {
    public open func foo(): Int64
}

public class OnlyImpl <: OpenBase {
    public func foo(): Int64 {
        2
    }
}

func call(a: OpenBase): Int64 {
    a.foo()
}

main() {
    call(OnlyImpl()) - 2
}
