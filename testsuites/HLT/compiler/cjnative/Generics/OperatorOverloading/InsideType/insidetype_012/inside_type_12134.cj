/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output

interface A<X, Y> {
    //operator func ~(a:A<X,Option<X>>):Bool {true}
    //operator func !(a:A<X,Option<X>>):Bool {true}
    //operator func +(a:A<X,Option<X>>):Bool {true}
    //operator func -(a:A<X,Option<X>>):Bool {true}
    //operator func ++(a:A<X,Option<X>>):Bool {true}
    //operator func --(a:A<X,Option<X>>):Bool {true}
    operator func [](b: A<X, Option<X>>): Bool {
        true
    }
    operator func *(b: A<X, Option<X>>): Bool {
        true
    }
    operator func /(b: A<X, Option<X>>): Bool {
        true
    }
    operator func %(b: A<X, Option<X>>): Bool {
        true
    }
    // operator *& is illegal
    operator func +(b: A<X, Option<X>>): Bool {
        true
    }
    operator func -(b: A<X, Option<X>>): Bool {
        true
    }
    operator func <<(b: A<X, Option<X>>): Bool {
        true
    }
    operator func >>(b: A<X, Option<X>>): Bool {
        true
    }
    operator func <(b: A<X, Option<X>>): Bool {
        true
    }
    operator func <=(b: A<X, Option<X>>): Bool {
        true
    }
    operator func >(b: A<X, Option<X>>): Bool {
        true
    }
    operator func >=(b: A<X, Option<X>>): Bool {
        true
    }
    operator func ==(b: A<X, Option<X>>): Bool {
        true
    }
    operator func !=(b: A<X, Option<X>>): Bool {
        true
    }
    operator func &(b: A<X, Option<X>>): Bool {
        true
    }
    operator func ^(b: A<X, Option<X>>): Bool {
        true
    }
    operator func |(b: A<X, Option<X>>): Bool {
        true
    }
    // operator func ^^(b:A<X,Option<X>>):Bool {true}
    // operator +& is illegal
    // operator -& is illegal
}

class A_B<X, Y> <: A<X, Y> {}

main(): Int64 {
    var a: A<Option<Int32>, Option<Int32>> = A_B<Option<Int32>, Option<Int32>>()
    var b: A<Option<Int32>, Option<Int32>> = A_B<Option<Int32>, Option<Int32>>()
    return 0
}
