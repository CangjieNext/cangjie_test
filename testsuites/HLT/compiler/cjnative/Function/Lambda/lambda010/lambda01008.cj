/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_builtin_invalid_index

main(): Int64 {
    let f = {
        a: Int64 =>
        let tup = (1, "")
        tup[a]
        0
    }
    if (f is (Int64) -> Int64) {
        return 0
    }
    return 1
}
