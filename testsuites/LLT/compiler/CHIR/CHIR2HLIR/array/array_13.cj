// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %overflowOpt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int32 {
    var l_a: Array<Int32> = [4]
    l_a[0] += 1
    if (l_a[0] != 5) {
        return 1
    }

    l_a[0] -= 1
    if (l_a[0] != 4) {
        return 1
    }

    return 0
}
