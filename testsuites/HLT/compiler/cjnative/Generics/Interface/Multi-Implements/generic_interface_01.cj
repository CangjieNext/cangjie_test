/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (B<String>("1").m != "1") {
        return 1
    }
    return 0
}

open class A<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
    public func foo(): T {
        return a
    }
}

class B<T> <: A<T> {
    public var b: T
    public init(x: T) {
        super(x)
        b = x
    }
    public prop m: T {
        get() {
            return foo()
        }
    }
}
