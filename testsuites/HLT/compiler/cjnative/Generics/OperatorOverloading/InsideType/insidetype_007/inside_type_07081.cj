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

interface D {}

class C <: D {}

class A_B<T> <: A<T> {}

interface A<T> {
    operator func !(): D {
        return C()
    }
    //    operator func +():D {return C()}
    operator func -(): D {
        return C()
    }
    /*
    operator func ++():D {return C()}
    operator func --():D {return C()}
     */
    operator func [](b: A<T>): D {
        return C()
    }
    // operator ** is illegal
    operator func *(b: A<T>): D {
        return C()
    }
    operator func /(b: A<T>): D {
        return C()
    }
    operator func %(b: A<T>): D {
        return C()
    }
    // operator *& is illegal
    operator func +(b: A<T>): D {
        return C()
    }
    operator func -(b: A<T>): D {
        return C()
    }
    operator func <<(b: A<T>): D {
        return C()
    }
    operator func >>(b: A<T>): D {
        return C()
    }
    operator func <(b: A<T>): D {
        return C()
    }
    operator func <=(b: A<T>): D {
        return C()
    }
    operator func >(b: A<T>): D {
        return C()
    }
    operator func >=(b: A<T>): D {
        return C()
    }
    operator func ==(b: A<T>): D {
        return C()
    }
    operator func !=(b: A<T>): D {
        return C()
    }
    operator func &(b: A<T>): D {
        return C()
    }
    operator func ^(b: A<T>): D {
        return C()
    }
    operator func |(b: A<T>): D {
        return C()
    }
    //     operator func ^^(b:A<T>):D {return C()}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<D> = A_B<D>()
    var b: A<D> = A_B<D>()
    var result: Array<(D)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a, b >= a,
        b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
