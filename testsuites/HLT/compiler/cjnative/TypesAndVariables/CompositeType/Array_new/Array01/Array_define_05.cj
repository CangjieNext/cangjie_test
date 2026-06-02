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
    var i = 0
    var t: Int8 = 0

    do {
        var a1 = [1i8, 2i8, 3i8]
        t += a1[i]
        i += 1
    } while (i < 0)

    return 1 - Int64(t)
}
