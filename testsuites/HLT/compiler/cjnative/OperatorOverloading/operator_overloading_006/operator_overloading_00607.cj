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

interface update<T> {
    operator func *(b: T): Int32
}

extend Rune <: update<Rune> {
    public operator func *(b: Rune): Int32 {
        return 0
    }
}

extend A <: update<A> {
    public operator func *(b: A): Int32 {
        return 0
    }
}

main(): Int64 {
    var a = A()
    var b: Rune = 'b'
    var c: Int32 = 1
    return Int64(a * a + b * b)
}
