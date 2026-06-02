// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var a = true
    var b = false
    var f1 = false && true
    var f2 = false || false
    var f3 = false

    if (true) {
    } else {
        return 1
    }

    if (f2) {
        return 2
    } else if (f3) {
        return 3
    } else {
    }

    if (f2) {
        return 4
    } else if (f3) {
        return 5
    } else if (f1) {
        return 6
    }
    if (false) {
        return 1
    }
    if (!false) {
        return 0
    }
    return 1
}
