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

type TI = I

extend Int64 <: TI {
    public operator func [](b: Int64): Int64 {
        3
    }
}

interface I {
    operator func [](b: Int64): Int64 {
        3
    }
}

struct structA {}

extend structA <: TI {
    public static func a(a: Int64) {
        return Int64(a)[a]
    }
}

main(): Int64 {
    if (structA.a(4) == 3 && structA()[1] == 3) {
        return 0
    } else {
        return 1
    }
}
