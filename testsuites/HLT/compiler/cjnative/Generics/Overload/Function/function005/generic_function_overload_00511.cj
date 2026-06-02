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

open class I<T> {
    public func test(a: T) {
        return 1
    }
    public func test(a: Int64) {
        return 2
    }
}

open class A<T> <: I<T> {
    public func test(a: Int32) {
        return 3
    }
}

class B<T> <: A<T> {
    public func test(a: Int16) {
        return 4
    }
    public var i: T
    public init(input: T) {
        i = input
    }
    public func a() {
        var I = super.test(i)
        return I
    }
}

main(): Int64 {
    var res1 = B<Int8>(1).a()
    if (res1 != 1) {
        return 1
    }
    return 0
}
