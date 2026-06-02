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
    var a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let b = 0..Int64(5)
    var res = 0
    for (i in a[b]) {
        res = res + i
    }
    if (res == 10) {
        return 0
    }
    return 1
}
