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
    var a: Data = Data()
    if (!(a == r'a')) {
        return 1
    }
    if (a == r'b') {
        return 2
    }
    return 0
}

class Data {}

extend Data {
    public operator func ==(right: Rune): Bool {
        if (right == r'a') {
            return true
        } else {
            return false
        }
    }
}
