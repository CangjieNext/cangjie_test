// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A<T> {
    public static let a: Int64 = 1
}

interface I<T> {
    static func time(): Int64 {
        return A<T>.a
    }
}

class Test<T> <: I<T> {}

main(): Int64 {
    let res = Test<Int64>.time()
    return res - 1
}
