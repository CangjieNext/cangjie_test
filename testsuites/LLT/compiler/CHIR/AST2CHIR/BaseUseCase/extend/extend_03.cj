// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-1: %run %run_opt %output

interface I<U> {
    static func foo<U>(a: Int64) {
        return 1
    }
}

class A<T> {}

extend<K> A<K> <: I<Int64> {
    func bar() {
        return 2
    }
}

main() {
    var a = A<Int64>.foo<Int64>(1)
    return a
}
