// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %compile_lib_opt %enableRedundantAssignRemoval %n.cj
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func f(x: Int32) {
    var y: Int32
    y = 0
    y = y + 1
    return y;
}
