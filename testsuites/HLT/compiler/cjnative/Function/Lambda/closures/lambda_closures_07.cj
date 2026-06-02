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

var a = 0
var f1: Unit = if (true) {
    var a = 1
    let b = 2
    var x1 = {=> a}
    var x2 = {=> b}
    var x3 = {=> a}()
    var x4 = {=> b}()
}
var f2: Unit = if (a > 0) {
    var a: Int32 = 1
    let b: Int32 = 2
    var x1 = foo({=> a})
    var x2 = foo({=> b})
    var x3 = goo({=> a}())
    var x4 = goo({=> b}())
    var x5 = foo({=> Coo().a})
    var x6 = foo({=> Roo().a})
}
var f5: () -> Int32 = if (a > 0) {
    var a: Int32 = 1
    let b: Int32 = 2
    {=> a}
    {=> b}
} else {
    var a: Int32 = 1
    let b: Int32 = 2
    {=> b}
    {=> a}
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
// ASSERT: scan sema_use_func_capture_var_alone
