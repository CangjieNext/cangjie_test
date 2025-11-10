// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %cmp_macro %f -o %output

import stdx.syntax.*
import std.ast

main() {
    let tks = quote(
        @LateM
        class A {}
    )
    let decl = ast.parseDecl(tks)
    decl.dump()
}