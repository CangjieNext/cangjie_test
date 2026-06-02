// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var a = 1
    var b = if (true) {
        a = 99
        10
        if (false) {
            a = 105
            102
        } else {
            a = 106
            108
            if (false) {
                a = 115
                112
            } else {
                a = 116
                118
            }
        }
    } else {
        a = 101
        102
        if (false) {
            103
        } else {
            104
        }
    }
    return b - 118
}
