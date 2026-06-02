// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
enum E {
    E2((Int64, Int64))
}

main() {
    var E2((x1, x2)) = E2((1, 2))
    let E2((x3, x4)) = E2((-1, -2))
    x1++;
    x2--
    return x1 + x2 + x3 + x4
}
