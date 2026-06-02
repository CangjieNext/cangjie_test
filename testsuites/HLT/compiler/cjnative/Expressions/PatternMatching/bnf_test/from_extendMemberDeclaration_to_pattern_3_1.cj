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

extend Int32 {
    public operator func +(a: Int64): Int32 {
        match (a) {
            case x: Int32 => 1
            case _ => 0
        }
        this + a
    }
}

func run(): Int64 {
    let x: Int32 = Int32(2) + 1
    if (x == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
