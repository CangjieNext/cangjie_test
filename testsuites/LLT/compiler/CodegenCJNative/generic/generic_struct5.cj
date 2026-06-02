// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan before call foo i=0
// ASSERT: scan after call foo i=1
// ASSERT: scan after call baz c.t.i=1

interface I {
    mut func foo(): Unit
    func goo(flag: Bool):Unit
}

class S <: I {
    public var i: Int64 = 0

    override public func foo(): Unit {
        i += 1
    }

    override public func goo(flag: Bool): Unit {
        var stage = if (flag) {
            "before call foo"
        } else {
            "after call foo"
        }
        println("${stage} i=${i}")
    }
}

class C<T> where T <: I {
    public var t: T
    init(t: T) {
        this.t = t
    }
}

func baz<T>(c:C<T>) where T <: I {
    try {
        c.t.goo(true)
        c.t.foo()
        c.t.goo(false)
    } finally {
    }
}

main() {
    var c = C<S>(S())
    baz(c)
    println("after call baz c.t.i=${c.t.i}")
}