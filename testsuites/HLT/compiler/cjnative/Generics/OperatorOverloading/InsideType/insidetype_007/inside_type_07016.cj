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
    public operator func !(): Bool {
        return true
    }
    //    operator func +():Bool {return true}
    public operator func -(): Bool {
        return true
    }
    /*
    operator func ++():Bool {return true}
    operator func --():Bool {return true}
     */
    public operator func [](b: A<T>): Bool {
        return true
    }
    // operator ** is illegal
    public operator func *(b: A<T>): Bool {
        return true
    }
    public operator func /(b: A<T>): Bool {
        return true
    }
    public operator func %(b: A<T>): Bool {
        return true
    }
    // operator *& is illegal
    public operator func +(b: A<T>): Bool {
        return true
    }
    public operator func -(b: A<T>): Bool {
        return true
    }
    public operator func <<(b: A<T>): Bool {
        return true
    }
    public operator func >>(b: A<T>): Bool {
        return true
    }
    public operator func <(b: A<T>): Bool {
        return true
    }
    public operator func <=(b: A<T>): Bool {
        return true
    }
    public operator func >(b: A<T>): Bool {
        return true
    }
    public operator func >=(b: A<T>): Bool {
        return true
    }
    public operator func ==(b: A<T>): Bool {
        return true
    }
    public operator func !=(b: A<T>): Bool {
        return true
    }
    public operator func &(b: A<T>): Bool {
        return true
    }
    public operator func ^(b: A<T>): Bool {
        return true
    }
    public operator func |(b: A<T>): Bool {
        return true
    }
    //     operator func ^^(b:A<T>):Bool {return true}
    // operator +& is illegal
    // operator -& is illegal
}

main(): Int64 {
    var a: A<Bool> = A<Bool>()
    var b: A<Bool> = A<Bool>()
    var result: Array<(Bool)> = [b[a], b * a, b / a, b % a, b + a, b - a, b << a, b >> a, b < a, b <= a, b > a, b >= a,
        b == a, b != a, b & a, b ^ a, b | a, !b, !b, -b]
    return 0
}
