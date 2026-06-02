// DEPENDENCE: ./test_parse_008_dep.cj
// EXEC: %compiler %cmp_opt_chir2hlir  %coverage_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.fs.*
internal import std.io.*

main() {
    let path: String = "./test_parse_008_dep.cj"
    let file: File = File(path, Read)
    let reader: StringReader<File> = StringReader(file)
    let code: String = reader.readToEnd()

    let tokens: Tokens = cangjieLex(code)
    let fileNode = parseProgram(tokens)
    var packageSpec = fileNode.packageHeader
    var packageName = packageSpec.packageIdentifier.value
    if (packageName != "p") {
        return 1
    }
    var decls = fileNode.decls
    if (decls.size != 1) {
        return 2
    }
    var mainDecl = (decls[0] as MainDecl).getOrThrow()
    var mainKey = mainDecl.keyword.value
    if (mainKey != "main") {
        return 3
    }
    var mainBody = mainDecl.block.nodes
    var varDecl = (mainBody[0] as VarDecl).getOrThrow()
    var ident = varDecl.identifier.value
    if (ident != "a") {
        return 4
    }
    var retExpr = (mainBody[1] as ReturnExpr).getOrThrow()
    var lit = (retExpr.expr as LitConstExpr).getOrThrow().literal.value
    if (lit != "0") {
        return 5
    }
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
