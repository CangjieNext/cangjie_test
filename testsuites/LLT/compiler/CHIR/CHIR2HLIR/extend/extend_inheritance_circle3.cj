// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %frontendCompiler %noColor %typecheck %diag_json %f 2>&1 | compare %f

interface A <: B {}

interface C <: A {}

interface B <: C {}

extend A <: C {}

main() {
    0
}
// ASSERT: scan sema_illegal_extended_type
// ASSERT: scan sema_inheritance_cycle
