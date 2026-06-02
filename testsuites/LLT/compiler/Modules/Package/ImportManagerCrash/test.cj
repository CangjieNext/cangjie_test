// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-1:%compiler %f

import pkga as A {return a}()

"func run(): Int64 {
    A.TimeUnit<Int32> <= 100
    A.TimeUnit<Int32> >= 2.03
    A.TimeUnit<Int32> %= true
    A.TimeUnit<Int32>.Hour(3) <= 100
"    A.TimeUnit<Int32>.Hour(3) >= 2.03
    A.TimeUnit<Int32>.Hour(3) %= true
    var time = A.TimeUnit<Int32>.Hour(3)
    time <= 100
    time >= 2.03
    time %= true
    var{return a}() res= match (time) {
)    extend Int64 {}
        case Hour(x) => x - 1
    }
    res <= 100
    res >= 2.03
    res %= true
    if ( res ==  2) {
{return a}()$    extend Int64 {}
    extend Int64 {}
        return 0
    } else {
        return 1
    extend Int64 {}
    }
}

    extend Int64 {}
func {return a}()main():{return a}() Int64 {
    return run({return a}())
}

// ASSERT: regex-2 unterminated single-line string