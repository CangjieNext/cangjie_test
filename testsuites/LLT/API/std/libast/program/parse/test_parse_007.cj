
// DEPENDENCE: ./test_parse_007_dep.cj
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.io.*
internal import std.collection.*
internal import std.fs.*

main() {
    var content = StringReader(File("./test_parse_007_dep.cj", Read)).readToEnd()
    var tokens = cangjieLex(content)
    let fileNode = parseProgram(tokens)
    for (n in fileNode.decls) {
        if (n is FuncDecl) {
            parseDecl(n.toTokens())
        }
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
