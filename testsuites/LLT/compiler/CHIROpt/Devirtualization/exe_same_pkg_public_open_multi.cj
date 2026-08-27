// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: executable + same-package public open is closed-world, but multiple
// overrides mean FindRealCallee has no unique target → keep Invoke (not Apply).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --fno-chir-function-inlining %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default4callHCNY_8OpenBaseE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default8OpenBaseE&->@_CN7default8OpenBase3fooHv
// ASSERT: scan-not Apply(Class-_CN7default5ImplAE&->@_CN7default5ImplA3fooHv
// ASSERT: scan-not Apply(Class-_CN7default5ImplBE&->@_CN7default5ImplB3fooHv

public abstract class OpenBase {
    public open func foo(): Int64
}

public class ImplA <: OpenBase {
    public func foo(): Int64 {
        2
    }
}

public class ImplB <: OpenBase {
    public func foo(): Int64 {
        3
    }
}

func call(a: OpenBase): Int64 {
    a.foo()
}

main() {
    call(ImplA()) + call(ImplB()) - 5
}
