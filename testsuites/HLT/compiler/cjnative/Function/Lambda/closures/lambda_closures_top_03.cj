/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

var a: Coo = Coo()
let b: Coo = Coo()
var c: Roo = Roo()
let d: Roo = Roo()
let n: Int32 = 1
var foo01 = {
    x: () -> Int32 =>
    a.b = x() + 2
    a.b
}
var foo02 = {x: () -> Int32 => n = 2}

func case02() {
    return {
        x: () -> Int32 =>
        a.b = x() + 2
        a.b
    }
}

func case03() {
    return {
        x: () -> Int32 =>
        b.b = x() + 2
        b.b
    }
}

func case04() {
    return {
        x: () -> Int32 =>
        c.b = x() + 2
        c.b
    }
}

func case06() {
    return {
        x: () -> Int32 =>
        d.a = x() + 2
        d.a
    }
}

func case07() {
    return {
        x: () -> Int32 =>
        d.b = x() + 2
        d.b
    }
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}

struct Roo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}
// ASSERT: scan sema_cannot_assign_to_immutable
