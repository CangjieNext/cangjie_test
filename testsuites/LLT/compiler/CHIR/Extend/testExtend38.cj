// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f -o %output
// EXEC-PIPE-0: %run %output

open class A <: I {}

class B <: A {}

interface I {}

extend B {}

func test1(): Int64 {
    let ins: I = B()
    match (ins) {
        case v: A => return 0
        case _ => ()
    }
    return 1
}

func test2(): Int64 {
    let ins: I = B()
    match (ins) {
        case v: B => return 0
        case _ => ()
    }
    return 1
}

func test3(): Int64 {
    let ins: I = B()
    match (ins) {
        case v: I => return 0
        case _ => ()
    }
    return 1
}

func test4(): Int64 {
    let ins: I = A()
    match (ins) {
        case v: A => return 0
        case _ => ()
    }
    return 1
}

func test5(): Int64 {
    let ins: I = A()
    match (ins) {
        case v: B => return 1
        case _ => ()
    }
    return 0
}

func test6(): Int64 {
    let ins: I = A()
    match (ins) {
        case v: I => return 0
        case _ => ()
    }
    return 1
}

main(): Int64 {
    return test1() + test2() + test3() + test4() + test5() + test6()
}
