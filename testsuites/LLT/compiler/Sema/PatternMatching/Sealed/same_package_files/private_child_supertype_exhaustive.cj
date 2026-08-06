// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: covered_private_child.cj
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f covered_private_child.cj 2>&1 | compare %f
// ASSERT: regex-not error
// ASSERT: regex-not warning

sealed interface CoveredRoot {}

sealed interface CoveredBranch <: CoveredRoot {}

class CoveredOther <: CoveredRoot {}

func classifyCovered(value: CoveredRoot): Int64 {
    match (value) {
        case _: CoveredBranch => 0
        case _: CoveredOther => 1
        case _ => 2
    }
}
