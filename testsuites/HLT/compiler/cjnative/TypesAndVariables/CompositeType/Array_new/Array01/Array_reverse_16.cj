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
    let b: Array<Array<Int8>> = [[1i8, 2i8, 3i8], [4i8, 5i8, 6i8]]
    b.reverse()
    b[0].reverse()

    if (b[0][0] != 6 || b[0][1] != 5 || b[0][2] != 4 || b[1][0] != 1 || b[1][1] != 2 || b[1][2] != 3) {
        return 2
    }
    return 0
}
