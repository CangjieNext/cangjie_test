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

class A_B<T> <: A<T> {}

interface A<T> {
    operator func !(): Float64 {
        return 0.0
    }
    //    operator func +():Float64 {return 0.0}
    operator func -(): Float64 {
        return 0.0
    }
    /*
    operator func ++():Float64 {return 0.0}
    operator func --():Float64 {return 0.0}
     */
    operator func [](b: A<T>): Float64 {
        return 0.0
    }
    // operator ** is illegal
    operator func *(b: A<T>): Float64 {
        return 0.0
    }
    operator func /(b: A<T>): Float64 {
        return 0.0
    }
    operator func %(b: A<T>): Float64 {
        return 0.0
    }
    // operator *& is illegal
    operator func +(b: A<T>): Float64 {
        return 0.0
    }
    operator func -(b: A<T>): Float64 {
        return 0.0
    }
    operator func <<(b: A<T>): Float64 {
        return 0.0
    }
    operator func >>(b: A<T>): Float64 {
        return 0.0
    }
    operator func <(b: A<T>): Float64 {
        return 0.0
    }
    operator func <=(b: A<T>): Float64 {
        return 0.0
    }
    operator func >(b: A<T>): Float64 {
        return 0.0
    }
    operator func >=(b: A<T>): Float64 {
        return 0.0
    }
    operator func ==(b: A<T>): Float64 {
        return 0.0
    }
    operator func !=(b: A<T>): Float64 {
        return 0.0
    }
    operator func &(b: A<T>): Float64 {
        return 0.0
    }
    operator func ^(b: A<T>): Float64 {
        return 0.0
    }
    operator func |(b: A<T>): Float64 {
        return 0.0
    }
    //     operator func ^^(b:A<T>):Float64 {return 0.0}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<Float64> = A_B<Float64>()
    var b: A<Float64> = A_B<Float64>()
    var result: Array<(Float64)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a, b >= a,
        b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
