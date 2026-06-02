// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var arr = Array<Int64>(3, repeat: 1)
    var charArr = Array<Rune>(3, repeat: r'a')
    if (arr[0] != 1 || arr[1] != 1 || arr[2] != 1) {
        return 1
    }
    if (charArr[0] != r'a' || charArr[1] != r'a' || charArr[2] != r'a') {
        return 2
    }
    return 0
}
