/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return 0
}

func foo<T>(x: A): A {
    return x
}

func foo<T>(x: T): T {
    return x
}

open class A {
    public var a: Int32
    public init(x: Int32) {
        a = x + 1
    }
    public func foo(x: B) {
        return 1
    }
}

class B <: A {
    public var b: Int32
    public init(x: Int32) {
        super(x)
        b = x
    }
    public func foo(x: A) {
        return 2
    }
}
