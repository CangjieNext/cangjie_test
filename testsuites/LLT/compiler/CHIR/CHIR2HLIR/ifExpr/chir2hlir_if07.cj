// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var f1 = true
    var f2 = false
    if (f2) {
        return 1
    } else if (f2) {
        return 2
    } else if (f1) {
        return 0
    } else if (f1) {
        return 4
    } else if (f1) {
        return 5
    } else if (f1) {
        return 6
    } else if (f1) {
        return 7
    } else if (f1) {
        return 8
    } else {
        return 10
    }
    return 18
}
