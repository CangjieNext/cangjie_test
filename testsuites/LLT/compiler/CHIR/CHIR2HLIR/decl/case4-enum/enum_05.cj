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
    var (t1, E2((x1, x2))) = (1, E2((1, 2)))
    let (t2, E2((x3, x4))) = (-1, E2((-1, -2)))
    x1++;
    x2--
    return t1 + t2 + x1 + x2 + x3 + x4
}
