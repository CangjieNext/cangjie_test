// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum e<T> {
    a
    | b(T)
    | c(Int32, Int32)
    | d(Int32, Int32, T)
}

enum e1<U> {
    aa(e<U>)
    | bb(Int32, e<U>)
}

main() {
    var a1 = e1<Int32>.aa(e<Int32>.a)
    var a2 = e1<Int32>.aa(e<Int32>.b(10))
    var a3 = e1<Int32>.aa(e<Int32>.c(100, 1000))
    var a4 = e1<Int32>.aa(e<Int32>.d(10000, 100000, 1000000))
    var ans1: Int32 = match (a1) { // 1
        case aa(a) => 1
        case aa(b(x)) => x
        case aa(c(x, y)) => x + y
        case aa(d(x, y, z)) => x + y + z
        case _ => 0
    } + match (a2) { // 10
        case aa(a) => 1
        case aa(b(x)) => x
        case aa(c(x, y)) => x + y
        case aa(d(x, y, z)) => x + y + z
        case _ => 0
    } + match (a3) { // 1100
        case aa(a) => 1
        case aa(b(x)) => x
        case aa(c(x, y)) => x + y
        case aa(d(x, y, z)) => x + y + z
        case _ => 0
    } + match (a4) { // 1110000
        case aa(a) => 1
        case aa(b(x)) => x
        case aa(c(x, y)) => x + y
        case aa(d(x, y, z)) => x + y + z
        case _ => 0
    }
    if (ans1 != 1111111) {
        return 1
    }
    var a5 = e1<Int32>.bb(1, e<Int32>.a)
    var a6 = e1<Int32>.bb(1, e<Int32>.d(10, 100, 1000))
    var ans2: Int32 = match (a5) { // 1
        case bb(x, a) => x + 1
        case bb(x, d(y, z, u)) => x + y + z + u
        case _ => 0
    } + match (a6) { // 1
        case bb(x, a) => x + 1
        case bb(x, d(y, z, u)) => x + y + z + u
        case _ => 0
    }
    if (ans2 != 1113) {
        return 1
    }
    return 0
}
