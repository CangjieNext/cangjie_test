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

interface A<T> <: Hashable & Equatable<T> {
    operator func *(b: A<T>): Bool {
        [this, b]
        return true
    }
    func hashCode(): Int64

    operator func ==(b: A<T>): Bool

    operator func !=(b: A<T>): Bool
}

class A_B<T> <: A<T> {
    public A_B(var a: Int64) {
    }

    public func hashCode(): Int64 {
        var c = Int64(a)
        return c
    }

    public operator func ==(b: A_B<T>) {
        return this.a == b.a
    }

    public operator func !=(b: A_B<T>) {
        return this.a != b.a
    }

    public operator func ==(b: T) {
        return true
    }

    public operator func !=(b: T) {
        return false
    }

    public operator func ==(b: A<T>) {
        return true
    }

    public operator func !=(b: A<T>) {
        return false
    }
}

main(): Int64 {
    var a: A<Int32> = A_B<Int32>(1)
    var b: A<Int32> = A_B<Int32>(2)
    if (!(b * a)) {
        return 1
    }
    return 0
}
