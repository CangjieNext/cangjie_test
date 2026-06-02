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

enum E<T> {
    e
}

class A<T> {
    public operator func !(): E<T> {
        return E<T>.e
    }
    //    operator func +():E<T> {return E<T>.e}
    public operator func -(): E<T> {
        return E<T>.e
    }
    /*
    operator func ++():E<T> {return E<T>.e}
    operator func --():E<T> {return E<T>.e}
     */
    public operator func [](b: A<T>): E<T> {
        return E<T>.e
    }
    // operator ** is illegal
    public operator func *(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func /(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func %(b: A<T>): E<T> {
        return E<T>.e
    }
    // operator *& is illegal
    public operator func +(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func -(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func <<(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func >>(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func <(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func <=(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func >(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func >=(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func ==(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func !=(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func &(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func ^(b: A<T>): E<T> {
        return E<T>.e
    }
    public operator func |(b: A<T>): E<T> {
        return E<T>.e
    }
    //     operator func ^^(b:A<T>):E<T> {return E<T>.e}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<Int32> = A<Int32>()
    var b: A<Int32> = A<Int32>()
    var result: Array<(E<Int32>)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a,
        b >= a, b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
