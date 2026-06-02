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
    if (foo<Int64>(1).n + foo<Int64>(1).m != 3) {
        return 1
    }
    return 0
}

func foo<T>(x: T): T {
    return x
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
