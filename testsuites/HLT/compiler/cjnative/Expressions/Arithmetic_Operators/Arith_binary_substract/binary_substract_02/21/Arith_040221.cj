/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    let a: Int8 = 0b11100000 - 0b01100001

    if (a != 127) {
        return 1
    }

    return 0
}
// ASSERT: scan sema_mismatched_types
