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
    operator func !(): A<Int32> {
        return A_B<Int32>()
    }
    //    operator func +():A<Int32> {return A_B<Int32>()}
    operator func -(): A<Int32> {
        return A_B<Int32>()
    }
    /*
    operator func ++():A<Int32> {return A_B<Int32>()}
    operator func --():A<Int32> {return A_B<Int32>()}
     */
    operator func [](b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    // operator ** is illegal
    operator func *(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func /(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func %(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    // operator *& is illegal
    operator func +(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func -(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func <<(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func >>(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func <(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func <=(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func >(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func >=(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func ==(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func !=(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func &(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func ^(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    operator func |(b: A<T>): A<Int32> {
        return A_B<Int32>()
    }
    //     operator func ^^(b:A<T>):A<Int32> {return A_B<Int32>()}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<A<Int32>> = A_B<A<Int32>>()
    var b: A<A<Int32>> = A_B<A<Int32>>()
    var result: Array<(A<Int32>)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a,
        b >= a, b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
