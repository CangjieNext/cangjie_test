// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f

struct A {
    var a = 1
}

main() {
    var a = A()
    a.a = 3
}

// ASSERT: scan [UselessAllocateElimination] Allocate at [14,5] and its users have been deleted
