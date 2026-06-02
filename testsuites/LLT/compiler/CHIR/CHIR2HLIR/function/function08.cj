// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func fab(n: Int64): Int64 {
    if (n <= 0) {
        return 0
    } else {
        return fab(n - 1)
    }
}

main(): Int64 {
    var a = fab(3)
    return a
}
