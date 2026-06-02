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
    var a: Int64 = 1
    if (foo(a.n) != 4) {
        return 1
    }
    if (foo(a.m) != 7) {
        return 2
    }
    return 0
}

func foo(x: Int32, y!: Int32 = x + 1): Int32 {
    return x * 2 + y
}

extend Int64 {
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
