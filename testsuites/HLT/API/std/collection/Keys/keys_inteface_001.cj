/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.collection.*

class A<T> <: EquatableCollection<T> where T <: Equatable<T> {
    public var count: Int64 = 0
    public func contains(element: T): Bool {
        return false
    }
    public func contains(all!: Collection<T>): Bool {
        return true
    }
    public prop size: Int64 {
        get() {
            return 78
        }
    }
    public func isEmpty(): Bool {
        return false
    }
    public func iterator(): Iterator<T> {
        return this.iterator()
    }
}

main() {
    var a = A<Int64>()
    var b = HashSet<Int64>([6, 7, 8])
    var c = ArrayList<Int64>([3, 4, 5])
    if (a.contains(8) != false || a.contains(all: c) != true) {
        return 1
    }
    return 0
}

func casename(s: Int64): Bool {
    return true
}
