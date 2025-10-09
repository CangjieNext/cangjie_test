/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface update<T> {
    operator func !(): T
}

extend Int32 <: update<Int32> {}

interface stronger<T> {
    operator func [](b: T): T
    // operator func !(): T
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
    //     operator func ^^(b: T): T
}

struct R {
    public var r: Int32
    public init(r!: Int32) {
        this.r = r
    }
}

extend R <: update<R> {
    public operator func !(): R {
        return R(r: !(this.r))
    }
}

extend R <: stronger<R> {
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

main(): Int64 {
    var zero: R = R(r: 0)
    var one: R = R(r: 1)
    var two: R = R(r: 2)
    var three: R = R(r: 3)
    var res: R = R(r: 8192)
    var a: R = zero > one << one + three * two ** -zero[zero]
    var final: R = three ^ one & res == zero > one << one + three * two ** -zero[zero]
    // 1. zero[zero] = R(-2)
    // 2. two ** -zero[zero] = R(4)
    // 3. one + three * two ** -zero[zero] = R(13)
    // 4. one << R(13) = res
    // 5. zero > R(13) = res
    // 6. res == res = one , if 1-5 got any error, 5`s result will be zero.
    // 7. one & one = one , one & zero = zero. So we choose one here.
    // 8. three ^ one = two , one ^ zero = three. So we choose three here.
    // 9. two | two = two , two | three = three. So we choose two here.
    // 10. zero ^^ two = R(123), so final.r = 123
    if (final.r != 2) {
        return 1
    }

    var first: R
    first = !-R(r: 1) //  first.r == 10
    if (first.r != 0) {
        return 2
    }

    var second: R
    second = R(r: 2) * R(r: 4) % R(r: 5) / R(r: 2)
    if (second.r != 1) {
        return 3
    }

    var third: R
    third = R(r: -1) + R(r: 5) - R(r: -2)
    if (third.r != 6) {
        return 4
    }

    var fourth: R
    fourth = R(r: 1) << R(r: 3) >> R(r: 2)
    if (fourth.r != 2) {
        return 5
    }

    return 0
}
