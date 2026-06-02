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
    var a = 10;
    if (f2) {
        a = 1
        return a
    } else if (f2) {
        a = 2
        return a
    } else if (f1) {
        a = 0
        return a
    }
    a = 18
    return a
}
