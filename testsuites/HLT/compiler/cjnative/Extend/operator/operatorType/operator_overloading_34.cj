/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a: Int32 = 1

    if ((a | r'a') != 55) {
        return 1
    }
    if ((a | r'b') != 66) {
        return 2
    }
    return 0
}

extend Int32 {
    public operator func |(right: Rune): Int32 {
        if (right == r'a') {
            return 55
        } else {
            return 66
        }
    }
}
