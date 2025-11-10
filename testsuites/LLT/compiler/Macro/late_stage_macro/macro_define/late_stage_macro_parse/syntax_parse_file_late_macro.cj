// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sourceFile/macro_expand_decl.cj
// (not Windows) EXEC: dos2unix macro_expand_decl.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*

main() {
    let node = parseFile("macro_expand_decl.cj")
    let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
    topLevelDecls = file.topLevelDecls
    let decl = (topLevelDecls[0] as MacroExpandDecl).getOrThrow()
    decl.toTokens().dump()
}