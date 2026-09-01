// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Func

public interface A {
    func foo(i: Int64): Int64 {
        return 2
    }
    func foo(i: Int16): Int64
}

public abstract class A1 <: A {
    public func foo(i: Int64): Int64 {
        let b = (i as Int16).getOrThrow()
        foo(b)
    }
    public func foo(i: Int16): Int64
}

main() {
    // compile-only smoke: A1 is abstract (foo(Int16) unimplemented)
    0
}
