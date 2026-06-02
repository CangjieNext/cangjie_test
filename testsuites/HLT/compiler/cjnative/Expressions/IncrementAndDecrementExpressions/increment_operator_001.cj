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

import std.collection.*

main() {
    let a = [0]
    let b = ArrayList<Int64>([0])
    let c = ArrayList<Byte>([0])
    a[0]++
    b[0]++
    c[0]++
    if (a[0] != 1 && b[0] != 1 && c[0] != 1) {
        return 1
    }
    a[0]--
    b[0]--
    c[0]--
    if (a[0] != 0 && b[0] != 0 && c[0] != 0) {
        return 2
    }
    0
}
