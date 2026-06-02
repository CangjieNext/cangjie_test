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

main(): Int64 {
    var a: Float64 = -2.1
    var aa: Float64 = 2.1
    var b: Int32 = Int32(a)
    var bb: Int32 = Int32(aa)
    var c: Int32 = -2
    var cc: Int32 = 2

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
