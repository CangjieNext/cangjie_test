// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var g_var: Int64 = 100

struct Test {
    public static let counter: Int64 = g_var
    public static func fun(): Int64 {
        return counter + 100
    }
}

main(): Int64 {
    var result = Test.fun()
    if (result == 200) {
        return 0
    }
    return 1
}
