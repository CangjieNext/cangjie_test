// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %clang_opt %n.cj 2>&1 | compare %f

// ASSERT: regex-not @llvm.used

class CA {
    init() {}
    init(x: Int64) {}
}

var a = "123"

main() {
    CA()
    println(a)
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
