// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    let outter = 2
    let a = outter + 8
    var lam = {
        c: Int64 =>
        var inner = outter + 5
        var b = a + inner
        b
    }
    var tmp = lam(20)
    return 0
}
