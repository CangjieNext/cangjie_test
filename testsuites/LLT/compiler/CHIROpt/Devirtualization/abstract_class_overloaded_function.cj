// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan-not Devirtualization

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
    0
}
