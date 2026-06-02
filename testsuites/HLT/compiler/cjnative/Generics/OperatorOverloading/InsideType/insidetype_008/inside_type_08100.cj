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

struct A<T> <: Hashable & Equatable<A<T>> {
    public A(var a: Int64) {
    }
    public operator func *(b: A<T>): Bool {
        [this, b]
        return true
    }

    public func hashCode(): Int64 {
        var c = Int64(a)
        return c
    }

    public operator func ==(b: A<T>) {
        return this.a == b.a
    }

    public operator func !=(b: A<T>) {
        return this.a != b.a
    }
}

main(): Int64 {
    var a: A<Int32> = A<Int32>(1)
    var b: A<Int32> = A<Int32>(2)
    if (!(b * a)) {
        return 1
    }
    return 0
}
