/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0

package demo

// Package-internal root: closed under --no-sub-pkg.
internal abstract class A {
    public open func foo(): Int64
}

// Public open middle type: not closed when building a staticlib
// (IsSubtypeSetComplete(B) == false); FindRealCallee must abandon on B.
public open class B <: A {
    public open func foo(): Int64 {
        1
    }
}

class D <: B {
    public override func foo(): Int64 {
        2
    }
}

// Field typed as A → TypeAnalysis gives SUBTYPE_OF A (not EXACTLY D).
class Box {
    let a: A

    public init(a: A) {
        this.a = a
    }

    public func call(): Int64 {
        a.foo()
    }
}

public func run(): Int64 {
    Box(D()).call()
}
