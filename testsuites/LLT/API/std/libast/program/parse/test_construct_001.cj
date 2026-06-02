// DEPENDENCE: ./test_parse_dump_005_dep.cj
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.fs.*
internal import std.io.*

main() {
    let path: String = "./test_parse_dump_005_dep.cj"
    let file: File = File(path, Read)
    let reader: StringReader<File> = StringReader(file)
    let code: String = reader.readToEnd()
    let tokens: Tokens = cangjieLex(code)
    let program = Program(tokens)
    var pkgHeader = program.packageHeader.toTokens()
    var newPkgHeader = PackageHeader(pkgHeader)
    if (newPkgHeader.keywordP.value != "package") {
        return 1
    }
    if (newPkgHeader.packageIdentifier.value != "p") {
        return 2
    }
    var innerToken_: Tokens = Token(TokenKind.NL) + quote(main() {})
    var input = program.importLists[0].toTokens().append(innerToken_)
    var a = parseProgram(input)
    var importList = ImportList(program.importLists[0].toTokens())
    if (importList.content.prefixPaths[0].value != "std") {
        return 3
    }
    if (importList.content.prefixPaths[1].value != "ast") {
        return 4
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
