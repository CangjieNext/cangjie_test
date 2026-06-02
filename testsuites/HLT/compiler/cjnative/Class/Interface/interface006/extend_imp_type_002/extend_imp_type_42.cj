/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {
    operator func |(b: Float16): Float16 {
        5.3
    }
}

type TI = I

extend Float16 <: TI {}

struct A<T> {
    public func f1(): Int64 {
        return Int64(Float16(1) | Float16(1))
    }
    public static func f2(a: T): T {
        return a
    }
}

main(): Int64 {
    if (A<TI>().f1() == 5 && A<Float16>.f2(Float16(1) | Float16(1) | Float16(1) | Float16(1)) == Float16(5.3)) {
        return 0
    } else {
        return 1
    }
}
