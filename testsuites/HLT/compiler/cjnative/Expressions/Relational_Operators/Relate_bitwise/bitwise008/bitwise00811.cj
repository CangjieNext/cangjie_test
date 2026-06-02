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

// 位操作符应用于Array索引/以及list元素

main(): Int64 {
    var Array: Array<Int64> = [1, 2, 3, 4, 10 >> 1, 6, 7, 8, 9, 10, 11]
    var res1 = Array[10 >> 1 >> 1]
    var res2 = !Array[4] >> 1
    if (res1 == 3 && res2 == -3) {
        return 0
    }
    return 1
}
