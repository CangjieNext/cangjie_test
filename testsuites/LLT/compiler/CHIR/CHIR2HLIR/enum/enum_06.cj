// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum A {
    a(Int32)
}

main() {
    var res = match (A.a(1)) {
        case a: A => 5
        case _ => 10
    }
    res - 5
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
