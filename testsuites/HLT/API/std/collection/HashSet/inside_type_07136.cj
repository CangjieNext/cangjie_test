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

struct A<T> {
    public operator func !(): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    //    operator func +():HashSet<Int32> {return HashSet<Int32>([1])}
    public operator func -(): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    /*
    operator func ++():HashSet<Int32> {return HashSet<Int32>([1])}
    operator func --():HashSet<Int32> {return HashSet<Int32>([1])}
     */
    public operator func [](b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    // operator ** is illegal
    public operator func *(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func /(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func %(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    // operator *& is illegal
    public operator func +(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func -(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func <<(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func >>(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func <(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func <=(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func >(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func >=(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func ==(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func !=(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func &(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func ^(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    public operator func |(b: A<T>): HashSet<Int32> {
        return HashSet<Int32>([1])
    }
    //     operator func ^^(b:A<T>):HashSet<Int32> {return HashSet<Int32>([1])}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<HashSet<Int32>> = A<HashSet<Int32>>()
    var b: A<HashSet<Int32>> = A<HashSet<Int32>>()
    var result: Array<(HashSet<Int32>)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a,
        b >= a, b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
