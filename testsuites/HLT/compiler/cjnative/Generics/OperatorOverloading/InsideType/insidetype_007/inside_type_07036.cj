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

interface D<T> {}

class C <: D<Int32> {}

class A<T> {
    public operator func !(): D<Int32> {
        return C()
    }
    //    operator func +():D<Int32> {return C()}
    public operator func -(): D<Int32> {
        return C()
    }
    /*
    operator func ++():D<Int32> {return C()}
    operator func --():D<Int32> {return C()}
     */
    public operator func [](b: A<T>): D<Int32> {
        return C()
    }
    // operator ** is illegal
    public operator func *(b: A<T>): D<Int32> {
        return C()
    }
    public operator func /(b: A<T>): D<Int32> {
        return C()
    }
    public operator func %(b: A<T>): D<Int32> {
        return C()
    }
    // operator *& is illegal
    public operator func +(b: A<T>): D<Int32> {
        return C()
    }
    public operator func -(b: A<T>): D<Int32> {
        return C()
    }
    public operator func <<(b: A<T>): D<Int32> {
        return C()
    }
    public operator func >>(b: A<T>): D<Int32> {
        return C()
    }
    public operator func <(b: A<T>): D<Int32> {
        return C()
    }
    public operator func <=(b: A<T>): D<Int32> {
        return C()
    }
    public operator func >(b: A<T>): D<Int32> {
        return C()
    }
    public operator func >=(b: A<T>): D<Int32> {
        return C()
    }
    public operator func ==(b: A<T>): D<Int32> {
        return C()
    }
    public operator func !=(b: A<T>): D<Int32> {
        return C()
    }
    public operator func &(b: A<T>): D<Int32> {
        return C()
    }
    public operator func ^(b: A<T>): D<Int32> {
        return C()
    }
    public operator func |(b: A<T>): D<Int32> {
        return C()
    }
    //     operator func ^^(b:A<T>):D<Int32> {return C()}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<D<Int32>> = A<D<Int32>>()
    var b: A<D<Int32>> = A<D<Int32>>()
    var result: Array<(D<Int32>)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a,
        b >= a, b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
