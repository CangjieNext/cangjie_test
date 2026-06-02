/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import std.collection.*

func IncBuf<T>(data: ArrayList<T>) {
    let n = data.size
    for (i in 0..n) {
        data[i] += 1
    }
}

var gStateBufI8 = ArrayList<Int8>([-5, -4, -3, -2, -1, 1, 2, 3, 4, 5])

main() {
    IncBuf<Int8>(gStateBufI8)
}
// ASSERT: scan sema_invalid_binary_expr
