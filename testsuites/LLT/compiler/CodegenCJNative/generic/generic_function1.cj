// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct A<T> {}

func test<T>(a: A<T>): Int64 {
    var i = match (a) {
        case _: A<Int32> => 0
        case _ => 1
    }
    return i
}

main() {
    var a = test<Int32>(A<Int32>())
    return a
}
