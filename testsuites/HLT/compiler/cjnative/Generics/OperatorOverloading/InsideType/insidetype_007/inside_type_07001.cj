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

class A<T> {
    public operator func !(): Int8 {
        return 0
    }
    //    operator func +():Int8 {return 0}
    public operator func -(): Int8 {
        return 0
    }
    /*
    operator func ++():Int8 {return 0}
    operator func --():Int8 {return 0}
     */
    public operator func [](b: A<T>): Int8 {
        return 0
    }
    // operator ** is illegal
    public operator func *(b: A<T>): Int8 {
        return 0
    }
    public operator func /(b: A<T>): Int8 {
        return 0
    }
    public operator func %(b: A<T>): Int8 {
        return 0
    }
    // operator *& is illegal
    public operator func +(b: A<T>): Int8 {
        return 0
    }
    public operator func -(b: A<T>): Int8 {
        return 0
    }
    public operator func <<(b: A<T>): Int8 {
        return 0
    }
    public operator func >>(b: A<T>): Int8 {
        return 0
    }
    public operator func <(b: A<T>): Int8 {
        return 0
    }
    public operator func <=(b: A<T>): Int8 {
        return 0
    }
    public operator func >(b: A<T>): Int8 {
        return 0
    }
    public operator func >=(b: A<T>): Int8 {
        return 0
    }
    public operator func ==(b: A<T>): Int8 {
        return 0
    }
    public operator func !=(b: A<T>): Int8 {
        return 0
    }
    public operator func &(b: A<T>): Int8 {
        return 0
    }
    public operator func ^(b: A<T>): Int8 {
        return 0
    }
    public operator func |(b: A<T>): Int8 {
        return 0
    }
    //     operator func ^^(b:A<T>):Int8 {return 0}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<Int8> = A<Int8>()
    var b: A<Int8> = A<Int8>()
    var result: Array<(Int8)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a, b >= a,
        b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
