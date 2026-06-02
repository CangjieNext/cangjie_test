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

extend Int32 {
    public func plus(a: Int32): Int32 {
        this + a
    }
}

func run(): Int64 {
    let x: Int32 = Int32(2).plus(1)
    if (x == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
