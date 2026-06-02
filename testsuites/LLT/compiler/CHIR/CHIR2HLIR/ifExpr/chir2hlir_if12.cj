// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var res1 = 3.14
    var res2 = true
    var res3 = 3
    var res4 = true
    var bVal = res1 == 3.14 && res2 == true && res3 == 3 && res4 == true
    if (bVal) {
        return 0
    }
    return 1
}
