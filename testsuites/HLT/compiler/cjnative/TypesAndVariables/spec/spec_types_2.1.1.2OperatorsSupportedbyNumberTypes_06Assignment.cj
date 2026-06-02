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
    var x: Int64 = 5
    var y: Int64 = 10
    x = y // assignment: x = 10
    x += y // compound assignment: x = 20
    x -= y // x = 10
    x *= y // x = 100
    x /= y // x = 10
    x %= y // x = 0
    x = 5 // x = 5
    x **= 2 // x = 25
    x <<= 1 // x = 50
    x >>= 2 // x = 12
    x &= y // x = 8
    x ^= y // x = 2
    x |= y // x = 10
    if (x == 10) {
        return 0
    }
    return 1
}
