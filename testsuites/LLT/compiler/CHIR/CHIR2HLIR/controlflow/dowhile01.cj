// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var a = 10
    do {
        a = a - 1
    } while (a != 2)
    if (a != 2) {
        return 1
    }
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
