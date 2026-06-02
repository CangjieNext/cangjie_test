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

struct A<T> {
    public operator func !(): Option<Int32> {
        return Option<Int32>.None
    }
    //    operator func +():Option<Int32> {return Option<Int32>.None}
    public operator func -(): Option<Int32> {
        return Option<Int32>.None
    }
    /*
    operator func ++():Option<Int32> {return Option<Int32>.None}
    operator func --():Option<Int32> {return Option<Int32>.None}
     */
    public operator func [](b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    // operator ** is illegal
    public operator func *(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func /(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func %(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    // operator *& is illegal
    public operator func +(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func -(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func <<(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func >>(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func <(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func <=(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func >(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func >=(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func ==(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func !=(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func &(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func ^(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    public operator func |(b: A<T>): Option<Int32> {
        return Option<Int32>.None
    }
    //     operator func ^^(b:A<T>):Option<Int32> {return Option<Int32>.None}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<Option<Int32>> = A<Option<Int32>>()
    var b: A<Option<Int32>> = A<Option<Int32>>()
    var result: Array<(Option<Int32>)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a,
        b >= a, b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
