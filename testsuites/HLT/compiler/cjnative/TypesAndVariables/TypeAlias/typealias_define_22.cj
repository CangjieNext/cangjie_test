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

type Lis = Array<Int32>

main(): Int64 {
    var list1: Lis = [1, 2, 3]
    var list2: Array<Int32> = [10, 20]
    var res: Int32 = list1[0] + list1[1] + list1[2] + list2[0] + list2[1]
    print(res.toString())
    if (res == 36) {
        return 0
    }
    return 1
}
