/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum E<X, Y> {
    e(X)
}

interface A<X, Y> {
    //operator func ~(a:A<X,E<X,Y>>):Bool {true}
    //operator func !(a:A<X,E<X,Y>>):Bool {true}
    //operator func +(a:A<X,E<X,Y>>):Bool {true}
    //operator func -(a:A<X,E<X,Y>>):Bool {true}
    operator func [](b: A<X, E<X, Y>>): Bool {
        true
    }
    // operator is illegal
    operator func *(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func /(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func %(b: A<X, E<X, Y>>): Bool {
        true
    }
    // operator *& is illegal
    operator func +(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func -(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func <<(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func >>(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func <(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func <=(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func >(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func >=(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func ==(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func !=(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func &(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func ^(b: A<X, E<X, Y>>): Bool {
        true
    }
    operator func |(b: A<X, E<X, Y>>): Bool {
        true
    }
    // operator func ^^(b:A<X,E<X,Y>>):Bool {true}
    // operator +& is illegal
    // operator -& is illegal
}

class A_B<X, Y> <: A<X, Y> {}

main(): Int64 {
    var a: A<Int32, E<Int32, Int32>> = A_B<Int32, E<Int32, Int32>>()
    var b: A<Int32, Int32> = A_B<Int32, Int32>()
    return 0
}
// ASSERT: scan sema_generic_infinite_instantiation
