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
    let b: Array<Float32> = [1.0, 2.0, 3.0]
    b.reverse()

    if (b[0] == 3.0 && b[1] == 2.0 && b[2] == 1.0) {
        return 0
    }
    return 2
}
