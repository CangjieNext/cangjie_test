/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface TR1 {
    operator func !(): Bool
}

interface TR2<T> {
    operator func [](b: T): T
    operator func **(b: T): T
    operator func *(b: T): T
    operator func /(b: T): T
    operator func %(b: T): T
    operator func +(b: T): T
    operator func -(b: T): T
}

struct Data {
    public var x: Int32
    public init(input: Int32) {
        x = input
    }
}

extend Data <: TR1 {
    public operator func !(): Bool {
        true
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

main(): Int64 {
    var a: Bool = true
    var b: Data = Data(1)
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
    if (!(!b)) {
        return 15
    }
    return 0
}
