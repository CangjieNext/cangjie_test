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

main() {
    let arr: Array<Int64> = Array<Int64>(5, {i => i + 1})
    let b = arr.clone()
    b[0] = 100
    if (arr[0] != 1 || arr[1] != 2 || arr[2] != 3 || arr[3] != 4 || arr[4] != 5 || b[0] != 100 || b[1] != 2 || b[2] != 3 ||
        b[3] != 4 || b[4] != 5) {
        return 2
    }
    return 0
}
