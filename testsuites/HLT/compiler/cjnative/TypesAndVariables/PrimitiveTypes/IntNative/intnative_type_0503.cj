/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

main(): IntNative {
    var li: Array<Array<IntNative>> = [[1, 2, 3], [1, 2, 3], [1, 2, 3]]
    if (li[0][0] != 1) {
        return 1
    }
    if (li[1][1] != 2) {
        return 1
    }
    if (li[2][2] != 3) {
        return 1
    }
    return 0
}
