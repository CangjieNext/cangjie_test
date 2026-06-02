/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



interface update {
    operator func !(a:This):This
}

extend Int32 <: update{
    public operator func !(a:Int32):Int32{
        if (a != 0) {
            return 0
        }
        return 10
    }
}

class R{
    public var r : Int32
    public operator func <(a:R,b:R):R{
        if (a.r < b.r) {
            return R(a.r)
        }
        return R(b.r)
    }
    public operator func <=(a:R,b:R):R{
        if (a.r <= b.r) {
            return R(a.r)
        }
        return R(b.r)
    }
    public operator func >(a:R,b:R):R{
        if (a.r > b.r) {
            return R(a.r)
        }
        return R(b.r)
    }
    public operator func >=(a:R,b:R):R{
        if (a.r >= b.r) {
            return R(a.r)
        }
        return R(b.r)
    }

    public operator func ==(a:R,b:R):R{
        if (a.r == b.r) {
            return R(1)
        }
        return R(0)
    }
    public operator func !=(a:R,b:R):R{
        if (a.r != b.r) {
            return R(1)
        }
        return R(0)
    }
}



main():Int64{
    var zero : R = R(0)
    var one : R = R(1)
    var two : R = R(2)
    var three : R = R(3)

    var first : R
    first = R(1) > R(0) < R(2) >= R(-1) <= R(3) 
    if (first.r != 1) {
        return 5
    }

    var second : R
    second = one == two != three 

    var test = ((((R(1) > R(0)) < R(2)) >= R(-1)) <= R(3))

    return test.r
}
// ASSERT: scan parse_this_type_not_allow
// ASSERT: scan parse_chained_none_associative
