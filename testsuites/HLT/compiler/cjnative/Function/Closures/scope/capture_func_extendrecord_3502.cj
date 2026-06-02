/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 EXCLUDE
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a = Aoo()

    if (a.loo1()(2) != 2) {
        return 1
    }
    if (a.loo2()() != 2) {
        return 2
    }
    if (a.loo3()() != 2) {
        return 3
    }
    if (a.loo4()() != 2) {
        return 4
    }
    if (a.loo5()() != 2) {
        return 5
    }

    if (a.noo1()(2) != 2) {
        return 1
    }
    if (a.noo2()() != 2) {
        return 2
    }
    if (a.noo3()() != 2) {
        return 3
    }
    if (a.noo4()() != 2) {
        return 4
    }
    if (a.noo5()() != 2) {
        return 5
    }

    return 0
}

struct Aoo {
    public static var b: Int32 = 2
}

extend Aoo {
    public func koo1(x!: Int32 = b) {
        return x
    }
    public func koo2() {
        var x = b;
        return x
    }
    public func koo3() {
        return b
    }
    public func koo4() {
        b;
        return 2
    }
    public func koo5() {
        b
    }

    public static func moo1(x!: Int32 = b) {
        return x
    }
    public static func moo2() {
        var x = b;
        return x
    }
    public static func moo3() {
        return b
    }
    public static func moo4() {
        b;
        return 2
    }
    public static func moo5() {
        b
    }

    public func loo1() {
        var a = koo1
        return a
    }
    public func loo2() {
        var a = koo2
        return a
    }
    public func loo3() {
        var a = koo3
        return a
    }
    public func loo4() {
        var a = koo4
        return a
    }
    public func loo5() {
        var a = koo5
        return a
    }

    public func noo1() {
        var a = moo1
        return a
    }
    public func noo2() {
        var a = moo2
        return a
    }
    public func noo3() {
        var a = moo3
        return a
    }
    public func noo4() {
        var a = moo4
        return a
    }
    public func noo5() {
        var a = moo5
        return a
    }
}
