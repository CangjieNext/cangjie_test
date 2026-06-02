/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test

import std.collection.Stack

class myStack<T> <: Stack<T> {
    init() {}
    public prop size: Int64 {
        get() {
            return 0
        }
    }
    public func isEmpty(): Bool {
        return true
    }
    public func toArray(): Array<T> {
        return Array<T>()
    }
    public func iterator(): Iterator<T> {
        throw Exception()
    }
    public func peek(): Option<T> {
        throw Exception()
    }
    public func remove(): Option<T> {
        throw Exception()
    }
    public func add(element: T): Unit {
        throw Exception()
    }
}

main() {
    0
}
