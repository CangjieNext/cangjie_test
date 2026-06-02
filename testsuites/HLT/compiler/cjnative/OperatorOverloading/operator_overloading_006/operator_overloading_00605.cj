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

class A {}

interface update {
    operator func *(b: Int32): Int32
}

extend Int8 <: update {
    public operator func *(b: Int32): Int32 {
        return 0
    }
}

extend A <: update {
    public operator func *(b: Int32): Int32 {
        return 0
    }
}

main(): Int64 {
    var a = A()
    var b: Int8 = 1
    var c: Int32 = 1
    return Int64(a * c + b * c)
}
