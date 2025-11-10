// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %cmp_macro macro_in_non_macro_pkg.cj
// ASSERT: scan redefinition of declaration 'M'

package define

import std.ast.*

public late macro LateM(input: Decl): Decl {
    println("LateM")
    return input
}