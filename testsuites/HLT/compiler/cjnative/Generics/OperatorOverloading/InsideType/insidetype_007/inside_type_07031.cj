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

class C {}

class A<T> {
    public operator func !(): C {
        return C()
    }
    //    operator func +():C {return C()}
    public operator func -(): C {
        return C()
    }
    /*
    operator func ++():C {return C()}
    operator func --():C {return C()}
     */
    public operator func [](b: A<T>): C {
        return C()
    }
    // operator ** is illegal
    public operator func *(b: A<T>): C {
        return C()
    }
    public operator func /(b: A<T>): C {
        return C()
    }
    public operator func %(b: A<T>): C {
        return C()
    }
    // operator *& is illegal
    public operator func +(b: A<T>): C {
        return C()
    }
    public operator func -(b: A<T>): C {
        return C()
    }
    public operator func <<(b: A<T>): C {
        return C()
    }
    public operator func >>(b: A<T>): C {
        return C()
    }
    public operator func <(b: A<T>): C {
        return C()
    }
    public operator func <=(b: A<T>): C {
        return C()
    }
    public operator func >(b: A<T>): C {
        return C()
    }
    public operator func >=(b: A<T>): C {
        return C()
    }
    public operator func ==(b: A<T>): C {
        return C()
    }
    public operator func !=(b: A<T>): C {
        return C()
    }
    public operator func &(b: A<T>): C {
        return C()
    }
    public operator func ^(b: A<T>): C {
        return C()
    }
    public operator func |(b: A<T>): C {
        return C()
    }
    //     operator func ^^(b:A<T>):C {return C()}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<C> = A<C>()
    var b: A<C> = A<C>()
    var result: Array<(C)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a, b >= a,
        b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
