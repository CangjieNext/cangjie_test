/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 EXCLUDE
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let f = {
        a, b => while (let (Some(x), y) <- (a, b)) {
            x + y.getOrThrow() + 1
            break
        }
    }
    if (f is (?Int64, ?Int64) -> Unit) {
        return 0
    }
    return 1
}
