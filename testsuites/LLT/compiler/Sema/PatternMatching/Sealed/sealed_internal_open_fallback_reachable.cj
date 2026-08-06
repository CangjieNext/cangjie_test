// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An internal abstract branch with an internal constructor can be extended from a child package.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not warning

abstract sealed class InternalRoot {}

class InternalLeft <: InternalRoot {}

abstract class InternalBranch <: InternalRoot {
    init() {}
}

class KnownInternalChild <: InternalBranch {}

func classifyInternal(value: InternalRoot): Int64 {
    match (value) {
        case _: InternalLeft => 0
        case _: KnownInternalChild => 1
        case _ => 2
    }
}
