// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var a1: Array<Array<Int8>> = [[1i8, 5i8, 2i8, 0i8, 8i8], [9i8, 5i8, 2i8, 0i8, 8i8]]

main(): Int64 {
    var x = a1[0][0]
    if (a1[0][0] != 1 || a1[1][0] != 9) {
        return 1
    }
    return 0
}
