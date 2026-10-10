// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A public open child can gain descendants outside this package, so the fallback remains reachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not warning

abstract sealed class OpenRoot {}

class OpenLeft <: OpenRoot {}

class OpenRight <: OpenRoot {}

public abstract class OpenBranch <: OpenRoot {}

class KnownOpenChild <: OpenBranch {}

func classifyOpen(value: OpenRoot): Int64 {
    match (value) {
        case _: OpenLeft => 0
        case _: OpenRight => 1
        case _: KnownOpenChild => 2
        case _ => 3
    }
}
