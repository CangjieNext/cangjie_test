/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

class A<T> <: Set<T> where T <: Equatable<T> & Hashable {
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
        println("this is put")
        return true
    }

    public func add(all!: Collection<T>): Unit {
        println("this is putAll")
    }

    public func remove(element: T): Bool {
        return true
    }

    public func remove(all!: Collection<T>): Unit {
        println("this is removeAll")
    }

    public func removeIf(predicate: (T) -> Bool): Unit {
        println("this is removeIf")
    }

    public func clear(): Unit {
        println("this is clear")
    }

    public func retain(all!: Set<T>): Unit {
        println("this is retainAll")
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

main(): Int64 {
    var r1 = HashSet<String>(["a", "c", "d"])
    var b = HashSet<String>()
    var size1 = r1.size
    var a = A<String>()
    r1.retain(all: a)
    var size2 = r1.size
    if (size1 != 3) {
        return 1
    }
    if (size2 != 3) {
        return 2
    }
    return 0
}
