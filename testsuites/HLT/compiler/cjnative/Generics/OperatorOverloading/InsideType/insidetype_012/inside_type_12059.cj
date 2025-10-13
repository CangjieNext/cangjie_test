/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A<X, Y> {
    //operator func ~(a:A<X,(A<X,Y>,A<X,Y>)>):Bool {true}
    //operator func !(a:A<X,(A<X,Y>,A<X,Y>)>):Bool {true}
    //operator func +(a:A<X,(A<X,Y>,A<X,Y>)>):Bool {true}
    //operator func -(a:A<X,(A<X,Y>,A<X,Y>)>):Bool {true}
    /*
    operator func ++(a:A<X,(A<X,Y>,A<X,Y>)>):Bool {true}
    operator func --(a:A<X,(A<X,Y>,A<X,Y>)>):Bool {true}
     */
    operator func [](b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    // operator ** is illegal
    operator func *(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func /(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func %(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    // operator *& is illegal
    operator func +(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func -(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func <<(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func >>(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func <(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func <=(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func >(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func >=(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func ==(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func !=(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func &(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func ^(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    operator func |(b: A<X, (A<X, Y>, A<X, Y>)>): Bool {
        true
    }
    //     operator func ^^(b:A<X,(A<X,Y>,A<X,Y>)>):Bool {true}
    // operator +& is illegal
    // operator -& is illegal
}

class A_B<X, Y> <: A<X, Y> {}

main(): Int64 {
    var a: A<Int32, (A<Int32, Int32>, A<Int32, Int32>)> = A_B<Int32, (A<Int32, Int32>, A<Int32, Int32>)>()
    var b: A<Int32, Int32> = A_B<Int32, Int32>()
    if (!(b[a])) {
        return 1
    }
    if (!(true)) {
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
    if (!(true)) {
        return 12
    }
    if (!(b + a)) {
        return 13
    }
    if (!(b - a)) {
        return 14
    }
    if (!(true)) {
        return 15
    }
    if (!(true)) {
        return 16
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
    return 0
}
// ASSERT: scan sema_generic_infinite_instantiation
