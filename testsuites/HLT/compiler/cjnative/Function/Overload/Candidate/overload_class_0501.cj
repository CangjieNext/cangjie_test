/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var a: B = B(1)
    var b = a.foo(a)
    if (b != 1) {
        return 1
    }
    return 0
}

open class A {
    public var a: Int32
    public init(x: Int32) {
        a = x + 1
    }
    public func foo(x: B): Int32 {
        return 1
    }
}

class B <: A {
    public var b: Int32
    public init(x: Int32) {
        super(x)
        b = x
    }
    public func foo(x: B): Int32 {
        return 2
    }
}
// ASSERT: scan sema_cannot_override
