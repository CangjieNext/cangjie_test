// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %frontendCompiler %typecheck %noColor %diag_json %f 2>&1 | compare %f

interface I<T> {}

class A<T> <: I<T> {}

extend<T> A<T> <: I<T> {}

main() {
    return 0
}
// ASSERT: scan sema_extend_duplicate_interface
