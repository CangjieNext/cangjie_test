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
    operator func **(b: Bool): Bool
    operator func *(b: Bool): Bool
    operator func /(b: Bool): Bool
    operator func %(b: Bool): Bool
    operator func +(b: Bool): Bool
    operator func -(b: Bool): Bool

    func as_bool(): Bool
}

interface TR2 {
    operator func <<(b: Bool): Bool
    operator func >>(b: Bool): Bool
    operator func &(b: Bool): Bool
    operator func ^(b: Bool): Bool
    operator func |(b: Bool): Bool

    func as_bool(): Bool
}

extend Bool <: TR1 & TR2 {
    public operator func **(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func *(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func /(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func %(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func +(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func -(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func <<(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func >>(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func &(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func ^(b: Bool): Bool {
        return this.as_bool()
    }
    public operator func |(b: Bool): Bool {
        return this.as_bool()
    }

    public func as_bool(): Bool {
        true
    }
}

main(): Int64 {
    var a: TR1 = false
    var b: TR2 = false
    var c: Bool = true

    a **= c

    if (!a.as_bool()) {
        return 1
    }

    a *= c
    if (!a.as_bool()) {
        return 2
    }

    a /= c
    if (!a.as_bool()) {
        return 3
    }

    a %= c
    if (!a.as_bool()) {
        return 4
    }

    a += c
    if (!a.as_bool()) {
        return 5
    }

    a -= c
    if (!a.as_bool()) {
        return 6
    }

    b <<= c
    if (!a.as_bool()) {
        return 7
    }

    b >>= c
    if (!a.as_bool()) {
        return 8
    }

    b &= c
    if (!a.as_bool()) {
        return 9
    }

    b ^= c
    if (!a.as_bool()) {
        return 10
    }

    b |= c
    if (!a.as_bool()) {
        return 11
    }

    return 0
}
