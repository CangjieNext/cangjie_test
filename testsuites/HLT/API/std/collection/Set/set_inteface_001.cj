/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

class A<T> <: Set<T> where T <: Equatable<T> & Hashable {
    public var count: Int64 = 0
    public func contains(element: T): Bool {
        return true
    }

    public func subsetOf(other: ReadOnlySet<T>): Bool {
        return false
    }

    public func contains(all!: Collection<T>): Bool {
        return true
    }

    public func add(element: T): Bool {
        count = count + 1
        return true
    }

    public func add(all!: Collection<T>): Unit {
        count = count + 1
    }

    public func remove(element: T): Bool {
        return true
    }

    public func remove(all!: Collection<T>): Unit {
        count = count + 1
    }

    public func removeIf(predicate: (T) -> Bool): Unit {
        count = count + 1
    }

    public func clear(): Unit {
        count = count + 1
    }

    public func retain(all!: Set<T>): Unit {
        count = count + 1
    }
    public func clone(): Set<T> {
        return HashSet<T>()
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
        return HashSet<T>().iterator()
    }
}

main() {
    var a = A<Int64>()
    var b = HashSet<Int64>([6, 7, 8])
    var c = ArrayList<Int64>([3, 4, 5])
    if (a.contains(8) != true || a.subsetOf(b) != false || a.contains(all: c) != true || a.remove(9) != true ||
        a.clone().size != 0 || a.size != 78 || a.isEmpty() != false) {
        return 1
    }
    a.add(65)
    if (a.count != 1) {
        return 2
    }
    a.add(all: c)
    if (a.count != 2) {
        return 3
    }
    a.add(all: c)
    if (a.count != 3) {
        return 4
    }
    a.removeIf(casename)
    if (a.count != 4) {
        return 5
    }
    a.clear()
    if (a.count != 5) {
        return 6
    }
    a.retain(all: b)
    if (a.count != 6) {
        return 7
    }
    a.iterator().next
    return 0
}

func casename(s: Int64): Bool {
    return true
}
