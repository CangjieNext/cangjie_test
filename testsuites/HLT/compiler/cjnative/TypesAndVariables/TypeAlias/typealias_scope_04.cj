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

type int = Int32

var i1: int = 3

main(): Int64 {
    var i2: Int32 = 1
    let i3: int = 2
    var res: int = i1 + i2 + i3
    if (res == 6) {
        return 0
    }
    return 1
}
