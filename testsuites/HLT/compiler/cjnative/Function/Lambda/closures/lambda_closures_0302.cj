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

var a = {
    =>
    var a: Int32 = 1
    var x3 = {=> a}()
    true
}()
var b = {
    =>
    let b: Int32 = 2
    var x2 = {=> b}
    var x4 = {=> b}()
    true
}
var c = {
    =>
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = {=> b}
    var x3 = {=> a}()
    var x4 = {=> b}()
    true
}()
var x = {
    =>
    var a = 1;
    var b = {=> a}()
}()

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

main(): Int64 {
    if (!a) {
        return 1
    }
    if (!b()) {
        return 1
    }
    if (!c) {
        return 1
    }
    if (x != ()) {
        return 1
    }
    return 0
}
