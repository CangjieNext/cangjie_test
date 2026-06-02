/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (foo<Int64>(1) != 3) {
        return 1
    }
    return 0
}

func foo<T>(x: T): Int32 where T <: I {
    return x.n + x.m
}

interface I {
    public prop m: Int32
    public prop n: Int32
}

extend Int64 <: I {
    public prop m: Int32 {
        get() {
            return 2
        }
    }
    public prop n: Int32 {
        get() {
            return 1
        }
    }
}
