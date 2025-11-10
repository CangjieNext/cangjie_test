// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %cmp_macro non_public_macro.cj
// ASSERT: scan redefinition of declaration 'M'

macro package define

import stdx.syntax.*

late macro LateM(input: Decl): Decl {
    println("LateM")
    return input
}