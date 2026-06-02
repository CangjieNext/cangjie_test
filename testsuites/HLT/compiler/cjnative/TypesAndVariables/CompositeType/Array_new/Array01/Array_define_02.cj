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

func define02(data!: Array<Int32> = [1, -5, 6]) {
    return data
}

main(): Int64 {
    let a = define02()
    let b = define02(data: [2, -3, 6])

    if (a[0] == 1 && a[1] == -5 && a[2] == 6 && b[0] == 2 && b[1] == -3 && b[2] == 6) {
        return 0
    }

    return 1
}
