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

func fooo(): UInt32 {
    0
}

main(): Int64 {
    let f = {
        a =>
        let x = a
        x + fooo()
    }
    if (f is (UInt32) -> UInt32) {
        return 0
    }
    return 1
}
