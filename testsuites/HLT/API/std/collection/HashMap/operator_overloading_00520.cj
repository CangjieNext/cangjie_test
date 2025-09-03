/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

interface update {
    operator func [](b: Bool): Unit
    operator func **(b: Bool): Bool
    operator func *(b: Bool): Bool
    operator func /(b: Bool): Bool
    operator func %(b: Bool): Bool
    operator func +(b: Bool): Bool
    operator func -(b: Bool): Bool
    operator func <<(b: Bool): Bool
    operator func >>(b: Bool): Bool
    operator func <(b: Bool): Bool
    operator func <=(b: Bool): Bool
    operator func >(b: Bool): Bool
    operator func >=(b: Bool): Bool
    operator func ==(b: Bool): Bool
    operator func !=(b: Bool): Bool
    operator func &(b: Bool): Bool
    operator func ^(b: Bool): Bool
    operator func |(b: Bool): Bool
    //        operator func ^^(b:Bool):Bool
    // operator func +():Bool
    operator func -(): Bool
    //    operator func ~():Bool
    operator func !(): Bool

    /*
    operator func ++():Bool
    operator func --():Bool
     */
}

extend HashMap<Int64, Int64> <: update {
    public operator func [](b: Bool): Unit {
        ()
    }
    public operator func **(b: Bool): Bool {
        true
    }
    public operator func *(b: Bool): Bool {
        true
    }
    public operator func /(b: Bool): Bool {
        true
    }
    public operator func %(b: Bool): Bool {
        true
    }
    public operator func +(b: Bool): Bool {
        true
    }
    public operator func -(b: Bool): Bool {
        true
    }
    public operator func <<(b: Bool): Bool {
        true
    }
    public operator func >>(b: Bool): Bool {
        true
    }
    public operator func <(b: Bool): Bool {
        true
    }
    public operator func <=(b: Bool): Bool {
        true
    }
    public operator func >(b: Bool): Bool {
        true
    }
    public operator func >=(b: Bool): Bool {
        true
    }
    public operator func ==(b: Bool): Bool {
        true
    }
    public operator func !=(b: Bool): Bool {
        true
    }
    public operator func &(b: Bool): Bool {
        true
    }
    public operator func ^(b: Bool): Bool {
        true
    }
    public operator func |(b: Bool): Bool {
        true
    }
    //        operator func ^^(b:Bool):Bool {true}
    // operator func +():Bool  {true}
    public operator func -(): Bool {
        true
    }
    //    operator func ~():Bool  {true}
    public operator func !(): Bool {
        true
    }
    /*
    operator func ++():Bool {true}
    operator func --():Bool {true}
     */
}

main(): Int64 {
    var a: Bool = false
    var b: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
    if ((b[a]) != ()) {
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
    if (!(b << a)) {
        return 17
    }
    if (!(b >> a)) {
        return 18
    }
    if (!(b < a)) {
        return 19
    }
    if (!(b <= a)) {
        return 20
    }
    if (!(b > a)) {
        return 21
    }
    if (!(b >= a)) {
        return 22
    }
    if (!(b == a)) {
        return 23
    }
    if (!(b != a)) {
        return 24
    }
    if (!(b & a)) {
        return 25
    }
    if (!(b ^ a)) {
        return 26
    }
    if (!(b | a)) {
        return 27
    }
    //    }
    // }
    if (!(-b)) {
        return 30
    }
    //    }
    if (!(!b)) {
        return 32
    }

    /*
        return 15
    }
    if (!(b-&a)) {
        return 16
    }
    if (!(b++)) {
        return 33
    }
    if (!(b--)) {
        return 34
    }
     */
    return 0
}
