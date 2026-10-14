/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Data2 {
    static func foo(a: Int64): Int64 {
        return 2
    }
}

interface Data3 <: Data2 {}

class Test <: Data2 & Data3 {}

main(): Int64 {
    var res2: Int64 = Test.foo(2)
    if (res2 != 2) {
        return 1
    }
    return 0
}
