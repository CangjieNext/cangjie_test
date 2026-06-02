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

interface stronger {
    operator func <(a:This,b:This):This
    operator func <=(a:This,b:This):This
    operator func >(a:This,b:This):This
    operator func >=(a:This,b:This):This
    operator func ==(a:This,b:This):This
    operator func !=(a:This,b:This):This
}

extend<Int32> Array<Int32> <: stronger {
    public operator func <(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] < b[0]) {
            return {a[0]}
        }
        return {b[0]}
    }
    public operator func <=(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] <= b[0]) {
            return {a[0]}
        }
        return {b[0]}
    }
    public operator func >(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] > b[0]) {
            return {a[0]}
        }
        return {b[0]}
    }
    public operator func >=(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] >= b[0]) {
            return {a[0]}
        }
        return {b[0]}
    }

    public operator func ==(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] == b[0]) {
            return {1}
        }
        return {0}
    }
    public operator func !=(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] != b[0]) {
            return {1}
        }
        return {0}
    }
}



main():Int64{
    var zero : Array<Int32> = {0}
    var one : Array<Int32> = {1}
    var two : Array<Int32> = {2}
    var three : Array<Int32> = {3}
    var n_one : Array<Int32> = {-1}

    var first : Array<Int32>

    first = one > zero < two >= n_one <= three 
    if (first[0] != 1) {
        return 5
    }

    var second : Array<Int32>
    second = one == two != three 

    var test = ((((one > zero) < two) >= n_one) <= three)

    return test[0]
}
// ASSERT: scan parse_this_type_not_allow
// ASSERT: scan parse_expected_double_arrow_in_lambda
// ASSERT: scan parse_chained_none_associative
