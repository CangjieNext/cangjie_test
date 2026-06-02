/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgb.*

class C {}

struct Data {
    public var x: Int32
    public init(input: Int32) {
        x = input
    }
}

extend Data <: TR2<Bool> {
    public operator func [](b: Bool): Bool {
        b
    }
    public operator func **(b: Bool): Bool {
        b
    }
    public operator func *(b: Bool): Bool {
        b
    }
    public operator func /(b: Bool): Bool {
        b
    }
    public operator func %(b: Bool): Bool {
        b
    }
    public operator func +(b: Bool): Bool {
        b
    }
    public operator func -(b: Bool): Bool {
        b
    }
}

extend C <: TR2<Bool> {
    public operator func [](b: Bool): Bool {
        b
    }
    public operator func **(b: Bool): Bool {
        b
    }
    public operator func *(b: Bool): Bool {
        b
    }
    public operator func /(b: Bool): Bool {
        b
    }
    public operator func %(b: Bool): Bool {
        b
    }
    public operator func +(b: Bool): Bool {
        b
    }
    public operator func -(b: Bool): Bool {
        b
    }
}

main(): Int64 {
    var a: Bool = true
    var b: Data = Data(1)
    var c = C()
    if (!(b[a])) {
        return 1
    }
    if (!(b ** a)) {
        return 8
    }
    if (!(b * a)) {
        return 9
    }
    if (!(b / a)) {
        return 10
    }
    if (!(b % a)) {
        return 11
    }
    if (!(b + a)) {
        return 13
    }
    if (!(b - a)) {
        return 14
    }

    if (!(c[a])) {
        return 29
    }
    if (!(c ** a)) {
        return 30
    }
    if (!(c * a)) {
        return 31
    }
    if (!(c / a)) {
        return 32
    }
    if (!(c % a)) {
        return 33
    }
    if (!(c + a)) {
        return 34
    }
    if (!(c - a)) {
        return 35
    }
    return 0
}
