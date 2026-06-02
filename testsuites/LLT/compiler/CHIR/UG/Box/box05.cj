// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC-1: %run %run_opt %n.%suffix

class CA {
    var a: Int64
    init(x: Int64) {
        a = x
    }
}

func foo<T>(x: T): Int64 {
    let res = match (x) {
        case val: CA => val.a
        case _ => CA(-1).a
    }
    return res
}

main() {
    var b: CA = CA(1)
    foo<CA>(b)
}
