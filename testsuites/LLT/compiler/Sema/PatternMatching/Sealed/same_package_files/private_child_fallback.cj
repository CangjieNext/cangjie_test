// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: private_child.cj
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f private_child.cj 2>&1 | compare %f
// ASSERT: regex-not warning

sealed interface PrivateRoot {}

class PrivateVisible <: PrivateRoot {}

func classifyPrivate(value: PrivateRoot): Int64 {
    match (value) {
        case _: PrivateVisible => 0
        case _ => 1
    }
}
