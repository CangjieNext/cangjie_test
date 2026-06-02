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

class R {
    public var r: Int32
    public init(r: Int32) {
        this.r = r
    }
    public operator func [](b: R): R {
        return R(-2)
    }

    public operator func !(): R {
        return R(!(this.r))
    }

    public operator func -(): R {
        return R(-(this.r))
    }

    public operator func **(b: R): R {
        var res: Int32 = 1
        var temp: Int32 = b.r
        while (temp > 0) {
            res = res * this.r
            temp = temp - 1
        }
        return R(res)
    }

    public operator func *(b: R): R {
        return R((this.r) * (b.r))
    }
    public operator func /(b: R): R {
        return R((this.r) / (b.r))
    }
    public operator func %(b: R): R {
        return R((this.r) % (b.r))
    }

    public operator func +(b: R): R {
        return R((this.r) + (b.r))
    }
    public operator func -(b: R): R {
        return R((this.r) - (b.r))
    }

    public operator func <<(b: R): R {
        return R((this.r) << (b.r))
    }
    public operator func >>(b: R): R {
        return R((this.r) >> (b.r))
    }

    public operator func <(b: R): R {
        if (this.r < b.r) {
            return R(this.r)
        }
        return R(b.r)
    }
    public operator func <=(b: R): R {
        if (this.r <= b.r) {
            return R(this.r)
        }
        return R(b.r)
    }
    public operator func >(b: R): R {
        if (this.r > b.r) {
            return R(this.r)
        }
        return R(b.r)
    }
    public operator func >=(b: R): R {
        if (this.r >= b.r) {
            return R(this.r)
        }
        return R(b.r)
    }

    public operator func ==(b: R): R {
        if (this.r == b.r) {
            return R(1)
        }
        return R(0)
    }
    public operator func !=(b: R): R {
        if (this.r != b.r) {
            return R(1)
        }
        return R(0)
    }

    public operator func &(b: R): R {
        return R((this.r) & (b.r))
    }

    public operator func ^(b: R): R {
        return R((this.r) ^ (b.r))
    }

    public operator func |(b: R): R {
        return R((this.r) | (b.r))
    }

    //    operator func ^^(b:R):R{
    //        if (b.r == 2) {
    //            return R(123)
    //        }
    //        if (b.r == 3) {
    //            return R(321)
    //        }
    //        return R(0)
    //    }
}

main(): Int64 {
    var zero: R = R(0)
    var one: R = R(1)
    var two: R = R(2)
    var three: R = R(3)
    var res: R = R(8192)
    var a: R = zero > one << one + three * two ** -zero[zero]
    var final: R = two | three ^ one & res == zero > one << one + three * two ** -zero[zero]
    // 1. zero[zero] = R(-2)
    // 2. two ** -zero[zero] = R(4)
    // 3. one + three * two ** -zero[zero] = R(13)
    // 4. one << R(13) = res
    // 5. zero > R(13) = res
    // 6. res == res = one , if 1-5 got any error, 5`s result will be zero.
    // 7. one & one = one , one & zero = zero. So we choose one here.
    // 8. three ^ one = two , one ^ zero = three. So we choose three here.
    // 9. two | two = two , two | three = three. So we choose two here.
    if (final.r != 2) {
        return 1
    }

    var first: R
    first = !-R(1) //  first.r == 10

    var second: R
    second = R(2) * R(4) % R(5) / R(2)

    var third: R
    third = R(-1) + R(5) - R(-2)

    var fourth: R
    fourth = R(1) << R(3) >> R(2)

    if (first.r != 0) {
        return 2
    }

    if (second.r != 1) {
        return 3
    }

    if (third.r != 6) {
        return 4
    }

    if (fourth.r != 2) {
        return 5
    }

    return 0
}
