// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  macro_define.cj %f.expect
// EXEC: %compiler %cmp_macro macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt --debug-macro %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %diff %f.expect %f.macrocall

import test.*

interface update<T> {
    operator func [](b: T): T
    operator func !(): T
    operator func -(): T
    operator func **(b: T): T
    operator func *(b: T): T
    operator func /(b: T): T
    operator func %(b: T): T
    operator func +(b: T): T
    operator func -(b: T): T
    operator func <<(b: T): T
    operator func >>(b: T): T
    operator func <(b: T): T
    operator func <=(b: T): T
    operator func >(b: T): T
    operator func >=(b: T): T
    operator func ==(b: T): T
    operator func !=(b: T): T
    operator func &(b: T): T
    operator func ^(b: T): T
    operator func |(b: T): T
}

struct R {
    public var r: Int32
    public init(r!: Int32) {
        this.r = r
    }
}

// test extend operator func from existed interface
@M[1]
extend R <: update<R> {
    public operator func !(): R {
        return R(r: !(this.r))
    }
    public operator func [](b: R): R {
        return R(r: -2)
    }
    public operator func -(): R {
        return R(r: -(this.r))
    }

    public operator func **(b: R): R {
        var res: Int32 = 1
        var temp: Int32 = b.r
        while (temp > 0) {
            res = res * this.r
            temp = temp - 1
        }
        return R(r: res)
    }

    public operator func *(b: R): R {
        return R(r: (this.r) * (b.r))
    }
    public operator func /(b: R): R {
        return R(r: (this.r) / (b.r))
    }
    public operator func %(b: R): R {
        return R(r: (this.r) % (b.r))
    }

    public operator func +(b: R): R {
        return R(r: (this.r) + (b.r))
    }
    public operator func -(b: R): R {
        return R(r: (this.r) - (b.r))
    }

    public operator func <<(b: R): R {
        return R(r: (this.r) << (b.r))
    }
    public operator func >>(b: R): R {
        return R(r: (this.r) >> (b.r))
    }

    public operator func <(b: R): R {
        if (this.r < b.r) {
            return R(r: this.r)
        }
        return R(r: b.r)
    }
    public operator func <=(b: R): R {
        if (this.r <= b.r) {
            return R(r: this.r)
        }
        return R(r: b.r)
    }
    public operator func >(b: R): R {
        if (this.r > b.r) {
            return R(r: this.r)
        }
        return R(r: b.r)
    }
    public operator func >=(b: R): R {
        if (this.r >= b.r) {
            return R(r: this.r)
        }
        return R(r: b.r)
    }

    public operator func ==(b: R): R {
        if (this.r == b.r) {
            return R(r: 1)
        }
        return R(r: 0)
    }
    public operator func !=(b: R): R {
        if (this.r != b.r) {
            return R(r: 1)
        }
        return R(r: 0)
    }

    public operator func &(b: R): R {
        return R(r: (this.r) & (b.r))
    }

    public operator func ^(b: R): R {
        return R(r: (this.r) ^ (b.r))
    }

    public operator func |(b: R): R {
        return R(r: (this.r) | (b.r))
    }
}

// test extend prop from existed interface
@M[1]
interface I {
    mut prop m: Int64
    prop n: Int64
}

class Foo {}

@M[1]
extend Foo <: I {
    @M[1]
    public mut prop m: Int64 {
        get() {
            return 2
        }
        set(v) {}
    }
    @M[1]
    public prop n: Int64 {
        get() {
            return 1
        }
    }
}

func testcase_001(): Int64 {
    var a: Foo = Foo()
    if (a.n != 1) {
        return 1
    }
    a.m = 10
    if (a.m != 2) {
        return 2
    }

    return 0
}

// test extend a new function
@M[1]
extend<T> Array<T> {
    operator func ==(right: Rune): Bool {
        if (right == r'a') {
            return true
        } else {
            return false
        }
    }
}

func testcase_002(): Int64 {
    var a = [1, 2]

    if (!(a == r'a')) {
        return 1
    }
    if (a == r'b') {
        return 2
    }
    return 0
}

main(): Int64 {
    var ret = testcase_001()
    if (ret != 0) {
        return ret
    }

    ret = testcase_002()
    if (ret != 0) {
        return ret
    }

    return 0
}
