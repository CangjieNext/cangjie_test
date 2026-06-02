/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (foo1()() != 1) {
        return 1
    }
    if (foo2() != ()) {
        return 2
    }
    if (foo3()() != 2) {
        return 3
    }
    if (foo4() != 0) {
        return 0
    }
    if (foo5()() != 2) {
        return 0
    }
    return 0
}

func foo1() {
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = {=> b}
    var x3 = {=> a}()
    var x4 = {=> b}()
    if (a > 1) {
        return {=> Coo().a}
    } else {
        return {=> Roo().a}
    }
}

func foo2() {
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = foo({=> b})
    var x3 = goo({=> a}())
    var x4 = goo({=> b}())
    var x5 = foo({=> Coo().a})
    var x6 = foo({=> Roo().a})
}

func foo3(): () -> Int32 {
    var a: Int32 = 1
    let b: Int32 = 2
    if (a == 2) {
        return {=> b * 2}
    }
    if (a != 2) {
        return {=> b}
    }
    return {=> b}
}

func foo4() {
    var a: Int32 = 1
    let b: Int32 = 2
    {=> a}()
    {=> b}
    return 0
}

func foo5() {
    var a: Int32 = 1
    let b: Int32 = 2
    {=> a}()
    {=> b}
}

func foo(x: () -> Int32) {
    return x
}

func goo(x: Int32) {
    return x
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
    public static var c: Int32 = 3
    public static let d: Int32 = 4
    public var e: Int32
    public let f: Int32
    public init() {
        e = 5
        f = 6
    }
}

struct Roo {
    public var a: Int32 = 1
    public let b: Int32 = 2
    public static var c: Int32 = 3
    public static let d: Int32 = 4
    public var e: Int32
    public let f: Int32
    public init() {
        e = 5
        f = 6
    }
}
