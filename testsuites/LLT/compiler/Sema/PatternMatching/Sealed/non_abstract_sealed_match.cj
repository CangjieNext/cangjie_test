// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A malformed sealed class must not enter the closed-hierarchy match path.
// EXEC: %frontendCompiler %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan non-abstract class cannot be modified by 'sealed'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

sealed class Root {}

class Child <: Root {}

func classify(value: Root): Int64 {
    match (value) {
        case _: Child => 0
        case _ => 1
    }
}

main() {
    classify(Child())
}
