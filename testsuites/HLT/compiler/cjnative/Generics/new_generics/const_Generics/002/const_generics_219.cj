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

const tup1 = (1, 2, 3, 4)
const tup2 = (1, "abc", 1.0, r'a', 0u8)
const v1 = tup1[0]
const v2 = tup2[1]

main() {
    const tup3 = (1, 2u32)
    const v3 = tup3[1]
    if (v1 == 1 && v2 == "abc" && tup2[4] == 0u8 && tup3[1] == UInt32(2) && v3 == 2u32) {
        return 0
    }
    return 1
}
