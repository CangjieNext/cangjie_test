// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var f = {
        =>
        var a = 1;
        var b = 9;
        var c = a + b;
        var d = 3;
        var e = 5;
        (a + b) * (c + d - e) + b + c * 10 + 6 * 3 + 2 * (2 + 3) - 2 // 215
    }()

    var e = {
        =>
        var a = 10
        var b = 5
        var c = a * b
        var d = c - a - b
        (d + 15) * 3 + a * b // 200
    }()

    return f - e - 15;
}
