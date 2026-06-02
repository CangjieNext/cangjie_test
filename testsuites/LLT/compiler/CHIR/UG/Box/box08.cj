// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Struct<Int64> -> I
func foo<T>(x: T): Int64 {
    match (x) {
        case v: SA<Int64> => v.a // unbox
        case _ => SA<Int64>(1).a
    }
    1
}

struct SA<T> {
    var a: T
    init(y: T) {
        a = y
    }
}

func test1() {
    var r1 = foo<SA<Int64>>(SA<Int64>(1))
    if (r1 != 1) {
        return 1
    }
    0
}

main() {
    test1()
}
