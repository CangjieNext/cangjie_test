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
interface update_int8 {
    operator func +(b: Rune): Int32
}

extend Int8 <: update_int8 {
    public operator func +(b: Rune): Int32 {
        return 1
    }
}

interface update_char<T> {
    operator func +(b: T): Int32
}

extend Rune <: update_char<Rune> {
    public operator func +(b: Rune): Int32 {
        return 2
    }
}

main(): Int64 {
    var a: Int8 = 1
    var b: Rune = '1'
    a + b
    return 0
}
