// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open class A<T> {}

interface EQ {}

extend Int64 <: EQ {}

extend<T> A<T> where T <: EQ {
    public func soo() {}
    func add(a: T): T {
        return a
    }
}

class B<E> <: A<Int64> {
    func test() {
        soo()
        return add(5)
    }
}

main() {
    let b = B<Int32>()
    return b.test() - 5
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
