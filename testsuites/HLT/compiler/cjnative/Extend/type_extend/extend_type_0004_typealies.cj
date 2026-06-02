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
import std.collection.*

class A<T> {}

interface I<T> <: Hashable & Equatable<TI<T>> {
    operator func ==(that: TI<T>): Bool {
        return true;
    }
    operator func !=(that: I<T>): Bool {
        return false
    }
    func hashCode(): Int64 {
        return 9
    }
}

type TI<T> = I<T>

type TA<T> = A<T>

extend<T> TA<T> <: TI<T> {
    public operator func ==(that: TI<T>): Bool {
        return true;
    }
    public operator func !=(that: TI<T>): Bool {
        return false
    }
    public func hashCode(): Int64 {
        return 9
    }
}

var a: HashSet<TI<Int64>> = HashSet<TI<Int64>>()

main(): Int64 {
    a.add(TA<Int64>())
    if (a.isEmpty()) {
        return 1
    }

    for (i in a) {
        if (i is TA<Int64> && i is TI<Int64>) {
        } else {
            return 2
        }
    }
    return 0
}
