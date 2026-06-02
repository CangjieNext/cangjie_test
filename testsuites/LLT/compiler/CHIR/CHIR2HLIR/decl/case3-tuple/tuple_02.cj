// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
main() {
    var ((a1, _), (_, b1, c1), (_, _)) = ((1, 2), ((), 4, 5), (6, 7))
    let ((a2, _), (_, b2, c2), (_, _)) = ((1, 2), ((), 4, 5), (6, 7))
    a1++;
    a1--;
    b1++;
    b1--
    return a1 + b1 - c1 + a2 + b2 - c2
}
