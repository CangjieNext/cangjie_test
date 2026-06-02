/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let ff = {
        a =>
        let x = a
        let arr: Array<Byte> = [1, 2, 3]
        arr[0] += x
    }
    if (ff is (Byte) -> Unit) {
        return 0
    }
    return 1
}
