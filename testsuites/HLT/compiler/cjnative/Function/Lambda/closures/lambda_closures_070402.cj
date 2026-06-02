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
    return 0
}

var a = 0
var f1: Unit = if ({
    =>
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = {=> b}
    var x3 = {=> a}()
    var x4 = {=> b}()
    true
}()) {
    ()
}
var f2: Unit = if ({
    =>
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = foo({=> b})
    var x3 = goo({=> a}())
    var x4 = goo({=> b}())
    var x5 = foo({=> Coo().a})
    var x6 = foo({=> Roo().a})
    false
}()) {
    ()
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

// ASSERT: regex-not :13:.*-not error

// ASSERT: regex-not :14:.*-not error

// ASSERT: regex-not :15:.*-not error

// ASSERT: regex-not :22:.*-not error

// ASSERT: regex-not :23:.*-not error

// ASSERT: regex-not :24:.*-not error

// ASSERT: regex-not :25:.*-not error

// ASSERT: regex-not :26:.*-not error
