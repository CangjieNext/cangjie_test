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
    var a: Rune = r'p'
    if (a.n != 1) {
        return 1
    }
    if (a.m != 2) {
        return 2
    }

    if (r'p'.n != 1) {
        return 1
    }
    if (r'p'.m != 2) {
        return 2
    }
    return 0
}

extend Rune {
    public prop m: Int64 {
        get() {
            return 2
        }
    }
    public prop n: Int64 {
        get() {
            return 1
        }
    }
}
