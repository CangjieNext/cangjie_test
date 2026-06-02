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

// 字面量直接调用位操作符，优先级
main(): Int64 {
    var c: Int64 = 0
    var d: Int64 = 28
    c = !!10 << 1 ^ 8 & 15 | 24
    if (c != d) {
        return c
    }
    return 0
}
